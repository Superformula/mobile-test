import 'package:flutter/material.dart';
import 'package:qr_code/utils/info_widget.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({
    Key key,
    @required this.tapButtonCallback,
  })  : assert(tapButtonCallback != null),
        super(key: key);

  final VoidCallback tapButtonCallback;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const InfoWidget(imagePath: 'assets/img/error.svg', message: 'Something wrong happened'),
          SizedBox(height: 16),
          RaisedButton(
            child: Text('Try again'),
            onPressed: tapButtonCallback,
            color: Colors.white,
            colorBrightness: Brightness.light,
          ),
        ],
      ),
    );
  }
}
