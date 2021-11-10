import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:qr_generator/screens/qr_details/bloc/qr_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterWidget extends StatelessWidget {
  final DateTime _expiresAt;
  final ThemeData _theme;

  const CounterWidget(
      {Key? key, required ThemeData theme, required DateTime dateTime})
      : _theme = theme,
        _expiresAt = dateTime,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CountdownTimer(
      textStyle: _theme.textTheme.headline4,
      endTime: _expiresAt.millisecondsSinceEpoch,
      onEnd: () => context.read<QrDetailsBloc>().add(RefreshSeed()),
    );
  }
}
