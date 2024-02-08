import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_leandro/core/routes/named_routes.dart';
import 'package:superformula_leandro/core/routes/routes.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/cubits/scan/scan_cubit.dart';
import 'package:superformula_leandro/features/qr_code_scan/presenter/pages/home/home_page.dart';

import '../../features/qr_code_scan/mocks/mocktail.dart';

void main() {
  final context = MockBuildContext();

  group('Routes |', () {
    test('Should return all routes with correct mappings', () {
      final routes = Routes.allRoutes(context);

      expect(routes[NamedRoutes.home]!(context), isA<HomePage>());
      expect(
        routes[NamedRoutes.qrCode]!(context),
        isA<MultiBlocProvider>(),
      );
      expect(
        routes[NamedRoutes.scan]!(context),
        isA<BlocProvider<ScanCubit>>(),
      );
    });

    test('Should return all routes with correct keys', () {
      final routes = Routes.allRoutes(context);

      expect(
        routes.keys,
        containsAll(
          [NamedRoutes.home, NamedRoutes.qrCode, NamedRoutes.scan],
        ),
      );
    });
  });
}
