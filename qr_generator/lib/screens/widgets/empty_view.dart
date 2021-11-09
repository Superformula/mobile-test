import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyView extends StatefulWidget {
  final String title;
  final Color background;
  const EmptyView({Key key, this.title, this.background}) : super(key: key);

  @override
  _EmptyViewState createState() => _EmptyViewState();
}

class _EmptyViewState extends State<EmptyView> with TickerProviderStateMixin {
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
              'assets/lottie-empty-box.json',
              fit: BoxFit.contain,
              repeat: false,
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Text(
                'No records to display',
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
