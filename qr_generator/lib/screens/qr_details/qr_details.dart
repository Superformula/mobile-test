import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generator/screens/qr_details/bloc/qr_details_bloc.dart';
import 'package:qr_generator/screens/widgets/error_view.dart';
import 'package:qr_generator/screens/widgets/offline_view.dart';

class QrDetails extends StatefulWidget {
  QrDetails({Key? key}) : super(key: key);

  @override
  _QrDetailsState createState() => _QrDetailsState();
}

class _QrDetailsState extends State<QrDetails> {
  late ThemeData _theme;
  late QrDetailsBloc _qrDetailsBloc;
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription<ConnectivityResult> _connectivitySubscription =
      _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

  @override
  void initState() {
    super.initState();
    _qrDetailsBloc = BlocProvider.of<QrDetailsBloc>(context);
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
              onPressed: () => _qrDetailsBloc.add(RefreshSeed()),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
        child: BlocListener(
            bloc: _qrDetailsBloc,
            listener: (context, state) {},
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
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          offlineChip(state.offline),
                          Card(
                            child: QrImage(
                              data: state.seedData.id,
                              version: QrVersions.auto,
                              size: MediaQuery.of(context).size.width / 1.2,
                              gapless: false,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Visibility(
                            //visible: state.,
                            child: CountdownTimer(
                              textStyle: _theme.textTheme.headline4,
                              endTime: state
                                  .seedData.expiresAt.millisecondsSinceEpoch,
                              onEnd: () => _qrDetailsBloc.add(RefreshSeed()),
                            ),
                            replacement: Text(
                              'Expired',
                              style: _theme.textTheme.headline4
                                  ?.copyWith(color: Colors.red),
                            ),
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
      ),
    );
  }

  Widget offlineChip(bool offline) {
    return Visibility(
      visible: offline,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Chip(
          backgroundColor: Colors.white,
          avatar: Icon(
            Icons.offline_pin,
            color: Colors.purple,
          ),
          label: Text(
            'Offline',
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}
