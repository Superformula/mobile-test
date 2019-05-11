import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supercode/models.dart';

class QrCode extends StatefulWidget {
  final bool loading;
  final Seed seed;
  final Function() fetchQRCode;
  final int timerDurationSeconds;

  const QrCode(
      {Key key,
      this.loading,
      this.seed,
      this.fetchQRCode,
      this.timerDurationSeconds})
      : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> with TickerProviderStateMixin {
  AnimationController _contoller;

  @override
  void didUpdateWidget(QrCode oldWidget) {
    super.didUpdateWidget(oldWidget);

    _contoller?.dispose();
    _contoller = null;

    if (oldWidget.seed != widget.seed && widget.seed != null) {
      _contoller = AnimationController(
          vsync: this,
          duration: Duration(seconds: widget.timerDurationSeconds));

      _contoller.addStatusListener(_animationListener);

      _contoller.forward();
    }
  }

  @override
  void dispose() {
    _contoller?.dispose();
    super.dispose();
  }

  void _animationListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        widget.fetchQRCode();
        break;
      default:
        break;
    }
  }

  Widget _buildQRCode() {
    return Center(
      child: Container(
        width: 200,
        height: 200,
        child: QrImage(
          data: widget.seed.seed,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCountDown() {
    return Countdown(
      animation: StepTween(begin: widget.timerDurationSeconds, end: 0)
          .animate(_contoller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
      ),
      body: widget.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: _buildQRCode(),
                ),
                _buildCountDown(),
              ],
            ),
    );
  }
}

class Countdown extends AnimatedWidget {
  final Animation<int> animation;

  Countdown({Key key, this.animation}) : super(key: key, listenable: animation);
  @override
  Widget build(BuildContext context) {
    return Text(
      '${animation.value.toString()}s',
      style: TextStyle(
        fontSize: 48,
      ),
    );
  }
}
