import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hawk_fab_menu/hawk_fab_menu.dart';
import 'package:mobile_test_app/repository/qr_repository.dart';
import 'package:mobile_test_app/widget/qr_page.dart';
import 'package:mobile_test_app/widget/scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'QR'),
      routes: {'qr': (context) => QRPage(), 'scan': (context) => ScanPage()},
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
  bool repoLoaded = false;
  TextEditingController controller = TextEditingController(text: '192.168.');
  @override
  void initState() {
    _showServerIPAddressDialog();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!repoLoaded) {
      return Container();
    }

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

  Future _showServerIPAddressDialog() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final ipAddress = await showGeneralDialog<String>(
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return SimpleDialog(
            title: Text('Server IP Address'),
            contentPadding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(labelText: 'E.g.: 192.168.0.0'),
              ),
              FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context, controller.text);
                },
                icon: Icon(Icons.check),
                label: Text('Enter'),
              )
            ],
          );
        },
      );

      GetIt.I.registerSingleton(QrRepository(ipAddress.trim()));
      setState(() {
        repoLoaded = true;
      });
    });
  }
}
