import 'package:get_it/get_it.dart';
import 'package:qr_app/route_names.dart';
import 'package:qr_app/services/navigation_service.dart';

class SeedBloc {
  NavigationService get navigationService =>
      GetIt.instance<NavigationService>();

  void navToQRCode() {
    navigationService.navigate(RouteNames.Code);
  }

  void navToScan() {
    navigationService.navigate(RouteNames.Scan);
  }

  dispose() {}
}
