import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code/app/view/app.dart';
import 'package:qr_code_repository/qr_code_repository.dart';
import 'package:qr_generator_api/qr_generator_api.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

void boostrap({
  required QrGeneratorApi qrCodeApi,
}) {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  final qrCodeRepository = QrCodeRepository(remoteApi: qrCodeApi);

  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      runApp(App(qrCodeRepository: qrCodeRepository));
    },
    (error, stack) => log(error.toString(), stackTrace: stack),
  );
}
