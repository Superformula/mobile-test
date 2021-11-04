import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OfflineView extends StatefulWidget {
  final VoidCallback onReloadTap;
  final String title;
  final Color background;
  const OfflineView({Key key, this.onReloadTap, this.title, this.background})
      : super(key: key);

  @override
  _OfflineViewState createState() => _OfflineViewState();
}

class _OfflineViewState extends State<OfflineView>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.background ?? Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Lottie.asset(
              'assets/lottie-no-internet-connection.json',
              animate: true,
              fit: BoxFit.contain,
              repeat: false,
              width: 200,
              height: 200,
            ),
            Text(
              "You're offline",
              style:
                  Theme.of(context).textTheme.headline6.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
