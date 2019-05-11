import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:supercode/models.dart';

class QrCode extends StatefulWidget {
  final bool loading;
  final Seed seed;
  final Function({Function() onError}) fetchQRCode;
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
  AnimationController _controller;
  GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    super.initState();
    _fetchQRCode();
    _scaffoldKey = GlobalKey<ScaffoldState>();
  }

  @override
  void didUpdateWidget(QrCode oldWidget) {
    super.didUpdateWidget(oldWidget);

    _controller?.dispose();
    _controller = null;

    if (oldWidget.seed != widget.seed && widget.seed != null) {
      _controller = AnimationController(
          vsync: this,
          duration: Duration(seconds: widget.timerDurationSeconds));

      _controller.addStatusListener(_animationListener);

      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _fetchQRCode() {
    widget.fetchQRCode(
      onError: () {
        _scaffoldKey?.currentState?.showSnackBar(
          SnackBar(
            content: Text('Failed to fetch QR Code. Please try again.'),
          ),
        );
      },
    );
  }

  void _animationListener(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        _fetchQRCode();
        break;
      default:
        break;
    }
  }

  Widget _buildQRCode() {
    if (widget.seed == null) {
      return null;
    }

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
    if (_controller == null) {
      return Container();
    }

    return Countdown(
      animation: StepTween(begin: widget.timerDurationSeconds, end: 0)
          .animate(_controller),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
