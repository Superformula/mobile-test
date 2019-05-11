import 'dart:async';

import 'package:supercode/models.dart';

class CancelTimer {}

class UpdateTimer {
  final Timer timer;

  UpdateTimer(this.timer);
}

class FetchQRCode {}

class FetchQRCodeSuccess {
  final Seed seed;

  FetchQRCodeSuccess(this.seed);
}

class NavigateToQRCode {}

class NavigateToScan {}

class TimerTick {}

class ValidateCode {
  final String code;

  ValidateCode(this.code);
}

class ValidateCodeSuccess {
  final bool codeIsValid;

  ValidateCodeSuccess(this.codeIsValid);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ValidateCodeSuccess &&
          runtimeType == other.runtimeType &&
          codeIsValid == other.codeIsValid;

  @override
  int get hashCode => codeIsValid.hashCode;
}

class ResetValidate {}
