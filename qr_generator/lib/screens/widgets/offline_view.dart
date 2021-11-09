import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OfflineView extends StatefulWidget {

  const OfflineView({
    Key? key,
  }) : super(key: key);

  @override
  _OfflineViewState createState() => _OfflineViewState();
}

class _OfflineViewState extends State<OfflineView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
