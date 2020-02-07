import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/material.dart';

class ScanningPage extends StatefulWidget {
  static const route = '/scanning';

  @override
  _ScanningPageState createState() => _ScanningPageState();
}

class _ScanningPageState extends State<ScanningPage>
    with SingleTickerProviderStateMixin {
  List<CameraDescription> cameras;
  QRReaderController controller;

  AnimationController animationController;
  Animation<double> verticalPosition;

  final reticleColour = Colors.purple;

  @override
  void initState() {
    super.initState();
    _configureAnimation();
    _configureCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (cameras == null || controller == null) {
      return Container();
    }

    if (!controller.value.isInitialized) {
      return Container();
    }

    return Center(
      child: Stack(
        children: <Widget>[
          _buildCameraPreview(),
//          _buildScanningAnimation(),
        ],
      ),
    );
  }

  Widget _buildCameraPreview() {
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: QRReaderPreview(controller),
    );
  }

  Widget _buildScanningAnimation() {
    return Center(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: 300,
            height: 300,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: reticleColour, width: 2.0)),
            ),
          ),
          Positioned(
            top: verticalPosition.value,
            child: Container(
              width: 300,
              height: 2.0,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: reticleColour, blurRadius: 4)],
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _configureAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });

    verticalPosition = Tween<double>(
      begin: 0.0,
      end: 300.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticInOut,
      ),
    )..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          animationController.reverse();
        } else {
          animationController.forward();
        }
      });
  }

  void _configureCamera() async {
    cameras = await availableCameras();
    controller = QRReaderController(
      cameras.first,
      ResolutionPreset.medium,
      [CodeFormat.qr],
      onQRCodeRead,
    );

    await controller.initialize();
    setState(() {});
    controller.startScanning();
    animationController.forward();
  }

  void onQRCodeRead(String qrCode) {}
}
