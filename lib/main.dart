import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qrtestcodeone/data/datasource/api/qrcode_api_service.dart';
import 'package:qrtestcodeone/domain/usecase/get_qrcode_seed_usecase.dart';

import 'app/routes.dart';
import 'data/datasource/qrcode_service_datasource.dart';
import 'data/repository/qrcode_repository_impl.dart';
import 'domain/repository/qrcode_repository.dart';
import 'feature/home/bloc/home_bloc.dart';
import 'feature/home/home_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<QrCodeRepository>(
          create: (_) => (QrCodeRepositoryImpl(
            QrCodeServiceDataSourceImpl(_buildService()),
          )),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              GetQrCodeSeedUseCase(context.read<QrCodeRepository>()),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'QR Code Test',
          theme: ThemeData(accentColor: Colors.white),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.Home,
          routes: <String, WidgetBuilder>{
            Routes.Home: (_) => HomePage(),
          },
        ),
      ),
    );
  }

  /// This can be injected using a different approach, for example
  /// use GetIt and use Dio as a factory, etc.
  QrCodeApiService _buildService() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger());
    return QrCodeApiService(
      dio,
      baseUrl: 'https://osfejxnyib.execute-api.us-east-1.amazonaws.com/prod/',
    );
  }
}
