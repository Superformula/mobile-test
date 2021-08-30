import 'package:get/get.dart';
import 'package:superformula_test/modules/404/unknown_route.dart';
import 'package:superformula_test/modules/home/home_view.dart';


class Routes {
  static const Home = '/home';

  static const Unknown = '/unknown';

  static final List<GetPage> pages = [
    GetPage(
      name: Home,
      page: () => HomeView(),
      // binding: HomeBinding(),
      // transition: Transition.size,
    ),
    


    /// This is how we can create a dynamic route that looks for Get.arguments, and reflects this in the URL on web
    //  GetPage(
    //   name: Game.createPath([':gameName']),
    //   binding: GameBinding(),
    //   page: () => GameView(),
    // ),
    /// 1) create a static function on the view you wish to have dynamic route
    /// static String routeName(String gameName) {
    ///   String uri = '/game/';
    ///   return uri + gameName;
    /// }
    ///
    ///2) When you navigate to this route, you would call Get.toNamed(GameView.routeName('myGame'));
    ///
    ///3) Then in the controller you can access arguments >  String name = Get.parameters['gameName']!;
    ///
    ///if you define a page like this, Get will ALWAYS expect arguments. To have a non-argument route, you will
    ///need to create a second GetPage() with no arguments
    ///Get also supports passing parameters //TODO give parameters example
  ];

  static GetPage get unknownRoute => GetPage(
        name: Unknown,
        page: () => UnknownRoute(),
      );
}
