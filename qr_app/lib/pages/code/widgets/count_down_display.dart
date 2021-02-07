import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_app/blocs/seed_bloc.dart';

class CountDownDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SeedBloc>(context, listen: false);
    return StreamBuilder<int>(
      stream: bloc.countDownValue,
      builder: (context, snapshot) {
        if (snapshot.hasError) return Text('Timer Error');
        if (!snapshot.hasData) return Text('Retrieving seed data');
        return Text('${snapshot.data} Seconds left');
      },
    );
  }
}
