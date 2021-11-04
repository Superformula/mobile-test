import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_generator/data/sqlite_persistence.dart';
import 'package:qr_generator/data/storage.dart';
import 'package:qr_generator/repositories/seed_repository.dart';
import 'package:qr_generator/screens/home_view/home_view.dart';
import 'package:qr_generator/screens/qr_details/bloc/qr_details_bloc.dart';
import 'package:qr_generator/screens/qr_details/qr_details.dart';
import 'package:qr_generator/screens/scan_view/bloc/scan_view_bloc.dart';
import 'package:qr_generator/screens/scan_view/scan_view.dart';
import 'package:qr_generator/utils/api_client.dart';
import 'package:qr_generator/utils/theme/principal_light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
// Initializing local storage
  SuperformulaStorage storage = await SuperformulaStorage.createFrom(
    future: SqlitePersistence.create(),
  );

  runApp(MyApp(
    storage: storage,
  ));
}

class MyApp extends StatelessWidget {
  final SuperformulaStorage storage;
  const MyApp({Key key, this.storage}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final SeedRepository _seedRepository = SeedRepository(netUtil: ApiClient());
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SeedRepository>(
            create: (context) => _seedRepository,
          ),
        ],
        child: MaterialApp(
          title: 'Qr Generator',
          theme: principalLightTheme(context),
          initialRoute: '/',
          routes: {
            // When navigating to the "/home" route, build the HomeView widget.
            '/home': (context) => HomeView(),
            // When navigating to the "/qr_view" route, build the QrView widget.
            '/qr_view': (context) => BlocProvider(
                  create: (BuildContext context) =>
                      QrDetailsBloc(_seedRepository, storage)..add(FetchSeed()),
                  child: QrDetails(),
                ),
            // When navigating to the "/scan_view" route, build the Scan view widget.
            '/scan_view': (context) => BlocProvider(
                  create: (BuildContext context) =>
                      ScanViewBloc(_seedRepository),
                  child: ScanView(),
                ),
          },
          home: HomeView(),
        ));
  }
}
