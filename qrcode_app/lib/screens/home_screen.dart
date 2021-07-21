import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode_app/widgets/expandable_fab.dart';
import 'package:qrcode_app/presentation/seed_presenter.dart';
// import 'package:scan/scan.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.presenter}) : super(key: key);
  final SeedPresenter presenter;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScanResult? scanResult;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StreamBuilder<PresenterState>(
                stream: widget.presenter.streamData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData)
                    return Container();
                  else if (snapshot.data is LoadingState)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else if (snapshot.data is FailureState)
                    return Container(
                      child: Text('Error'),
                    );
                  else {
                    print(snapshot.data!.seed.seed);
                    return CustomPaint(
                      size: Size.square(200),
                      painter: QrPainter(
                        data: snapshot.data!.seed.seed,
                        version: QrVersions.auto,
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.square,
                          color: Color(0xff128760),
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                          dataModuleShape: QrDataModuleShape.circle,
                          color: Color(0xff1a5441),
                        ),
                      ),
                    );
                  }
                }),
            StreamBuilder<int>(
                stream: widget.presenter.expirationData,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || (snapshot.data == 0))
                    return Container(
                      child: Text(''),
                    );
                  else {
                    return Text(
                        'Expires at ' + snapshot.data.toString() + ' seconds');
                  }
                }),
          ],
        ),
      ),
      floatingActionButton: ExpandableFab(
        distance: 80.0,
        children: [
          ActionButton(
            onPressed: () => widget.presenter.getData(),
            icon: const Icon(Icons.code_sharp),
            label: 'Generate',
          ),
          ActionButton(
            onPressed: () => _scan(),
            icon: const Icon(Icons.linked_camera),
            label: 'Scan',
          ),
        ],
      ),
    );
  }

  Future<void> _scan() async {
    try {
      final ScanResult result = await BarcodeScanner.scan(
        options: ScanOptions(
          restrictFormat: [BarcodeFormat.qr],
          useCamera: -1,
        ),
      );
      print('result scan:' + result.rawContent);
      if (result.rawContent.isNotEmpty) _showAction(context, result.rawContent);
    } on PlatformException catch (e) {
      setState(() {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });
    }
  }

  void _showAction(BuildContext context, String resultScan) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(resultScan),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}
