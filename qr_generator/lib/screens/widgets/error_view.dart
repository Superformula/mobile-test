import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorView extends StatefulWidget {
  final VoidCallback onReloadTap;
  final VoidCallback onCloseTap;
  final bool appBar;
  final dynamic error;
  const ErrorView(
      {Key key,
      this.onReloadTap,
      this.onCloseTap,
      this.appBar = true,
      this.error})
      : super(key: key);

  @override
  _ErrorViewState createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: widget.appBar
            ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () =>
                      widget.onCloseTap ?? Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )
            : null,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Lottie.asset(
                  'assets/lottie-error.json',
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
                Text(
                  'An error occurred',
                  style: _textTheme.headline5,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text('Try again', style: _textTheme.caption),
                Visibility(
                    visible: widget.error != null,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 40),
                      child: Text(
                        widget.error ?? '',
                        textAlign: TextAlign.center,
                        style: _textTheme.bodyText2.copyWith(color: Colors.red),
                      ),
                    )),
                Visibility(
                  visible: widget.onReloadTap != null,
                  child: FloatingActionButton.extended(
                    label: Text(
                      'RELOAD',
                      style: _textTheme.button,
                    ),
                    onPressed: () => widget.onReloadTap(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
