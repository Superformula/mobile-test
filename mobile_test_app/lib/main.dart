import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:mobile_test_app/qr_cubit/qr_cubit.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/widget/qr_page.dart';
import 'package:mobile_test_app/widget/scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final qrRepository = QrRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCubit(repository: qrRepository),
      child: MaterialApp(
        title: 'QR',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'QR'),
        routes: {'qr': (context) => QRPage(), 'scan': (context) => ScanPage()},
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: HawkFabMenu(
        body: Builder(
          builder: (BuildContext context) {
            return Container();
          },
        ),
        items: [
          HawkFabMenuItem(
              label: 'Scan',
              ontap: () {
                Navigator.pushNamed(
                  context,
                  'scan',
                );
              },
              icon: Icon(Icons.camera_alt_outlined)),
          HawkFabMenuItem(
              label: 'QR Code',
              ontap: () {
                Navigator.pushNamed(
                  context,
                  'qr',
                );
              },
              icon: Icon(Icons.qr_code_outlined)),
        ],
      ),
    );
  }
}
