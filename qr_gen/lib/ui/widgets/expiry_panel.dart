import 'package:flutter/material.dart';
import 'package:qr_gen/core/models/seed.dart';
import 'package:timer_builder/timer_builder.dart';

class ExpiryPanel extends StatelessWidget {
  final Seed seed;
  final VoidCallback onRefresh;
  ExpiryPanel({@required this.seed, @required this.onRefresh});
  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
      final isExpired = seed.expiresAt.isBefore(DateTime.now());
      final formattedExpiration =
          seed.expiresAt.difference(DateTime.now()).inSeconds.abs();
      final prefix = isExpired ? 'Expired' : 'Expires in';
      final suffix = isExpired ? 'ago' : '';

      return Column(
        children: <Widget>[
          Text('$prefix ${formattedExpiration}s $suffix'),
          SizedBox(height: 25),
          FlatButton(
            child: Text('Request new code'),
            onPressed: onRefresh,
          )
        ],
      );
    });
  }
}
