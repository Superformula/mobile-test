import 'dart:async';

import 'package:supercode/models.dart';

class CancelTimer {}

class UpdateTimer {
  final Timer timer;

  UpdateTimer(this.timer);
}

class FetchQRCode {
  final Function() onError;

  FetchQRCode({this.onError});
}

class FetchQRCodeSuccess {
  final Seed seed;

  FetchQRCodeSuccess(this.seed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FetchQRCodeSuccess &&
          runtimeType == other.runtimeType &&
          seed == other.seed;

  @override
  int get hashCode => seed.hashCode;
}

class FetchQRCodeError {}

class NavigateToQRCode {}

class NavigateToScan {}

class TimerTick {}

class ValidateCode {
  final String code;
  final Function() onError;

  ValidateCode(this.code, {this.onError});
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

class ValidateCodeError {}

class ResetValidate {}
