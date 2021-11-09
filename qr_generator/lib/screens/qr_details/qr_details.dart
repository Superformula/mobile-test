import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/screens/qr_details/bloc/qr_details_bloc.dart';
import 'package:qr_generator/screens/qr_details/widgets/counter_widget.dart';
import 'package:qr_generator/screens/qr_details/widgets/offline_chip.dart';
import 'package:qr_generator/screens/qr_details/widgets/qr_image.dart';
import 'package:qr_generator/screens/widgets/error_view.dart';
import 'package:qr_generator/screens/widgets/offline_view.dart';

class QrDetails extends StatefulWidget {
  const QrDetails({Key? key}) : super(key: key);

  @override
  _QrDetailsState createState() => _QrDetailsState();
}

class _QrDetailsState extends State<QrDetails> {
  late ThemeData _theme;
  late QrDetailsBloc _qrDetailsBloc;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _qrDetailsBloc = BlocProvider.of<QrDetailsBloc>(context);
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _qrDetailsBloc.add(CheckConnectivity(result));
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Details'),
        actions: [
          IconButton(
              onPressed: () => context.read<QrDetailsBloc>().add(RefreshSeed()),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
          child: BlocBuilder(
        bloc: _qrDetailsBloc,
        builder: (context, state) {
          if (state is QrDetailsError) {
            return ErrorView(
              appBar: true,
              error: state.error,
            );
          }
          if (state is QrDetailsLoaded) {
            if (state.offline && state.seedData == null) {
              return const OfflineView();
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OfflineChip(
                      offline: state.offline,
                    ),
                    QrImageWidget(seedData: state.seedData.id),
                    const SizedBox(
                      height: 10,
                    ),
                    CounterWidget(
                      theme: _theme,
                      dateTime: state.seedData.expiresAt,
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
