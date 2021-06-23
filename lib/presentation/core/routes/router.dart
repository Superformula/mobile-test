import 'package:auto_route/auto_route.dart';
import 'package:qr_generator/presentation/home/home_page.dart';

@MaterialAutoRouter(routes: [
  MaterialRoute(page: HomePage, initial: true),
  // MaterialRoute(page: SignInPage, path: '/sign-in'),
  // MaterialRoute(page: AuthorizationPage, path: 'auth'),
  // MaterialRoute(page: StarredReposPage, path: '/starred'),
], replaceInRouteName: 'Page,Route')
class $AppRouter {}
