import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_test_app/cubit/qr_cubit.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/widget/expiration_countdown.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final qrRepository = QrRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => QrCubit(repository: qrRepository),
        child: MyHomePage(title: 'QR'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QrCubit, QrState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Builder(
            builder: (BuildContext context) {
              if (state is QrGenerated) {
                return Center(
                  child: Column(
                    children: [
                      QrImage(
                        data: state.qrCode.code,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      ExpirationCountdown(
                        expiresAt: state.qrCode.expiresAt,
                        onExpiration: () async {
                       
                        },
                      ),
                      Switch(
                        value: state.autoGenerate,
                        onChanged: qrCubit.setAutoRefresh,
                      )
                    ],
                  ),
                );
              } else if (state is QrLoading) {
                return Center(
                  child: Container(
                      height: 200, width: 200, child: Text('Loading...')),
                );
              } else {
                return Container();
              }
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              qrCubit.generateQrCode();
            },
          ),
        );
      },
    );
  }

  QrCubit get qrCubit => context.read<QrCubit>();
}
