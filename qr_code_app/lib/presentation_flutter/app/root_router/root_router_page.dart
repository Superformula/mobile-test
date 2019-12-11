import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

typedef Widget BuildHomePage(
  Function onQrCode,
  Function onScanner,
);
typedef Widget BuildQrCodePage(
  Function onBack,
);
typedef Widget BuildScannerPage(
  Function onBack,
);

class RootRouterPage extends StatefulWidget {
  final BuildHomePage buildHomePage;
  final BuildQrCodePage buildQrCodePage;
  final BuildScannerPage buildScannerPage;

  const RootRouterPage({
    Key key,
    @required this.buildHomePage,
    @required this.buildQrCodePage,
    @required this.buildScannerPage,
  }) : super(key: key);

  @override
  _RootRouterPageState createState() => _RootRouterPageState();
}

class _RootRouterPageState extends State<RootRouterPage> {
  static const String ROUTE_HOME = "/";
  static const String ROUTE_QR_CODE = "/qr-code";
  static const String ROUTE_SCANNER = "/scanner";

  GlobalKey<NavigatorState> _navigatorKey;

  @override
  void initState() {
    _navigatorKey = GlobalKey<NavigatorState>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Handle hard back button
    return WillPopScope(
      onWillPop: () {
        _navigatorKey.currentState.pop(context);

        return Future.value(false);
      },
      child: Navigator(
        key: _navigatorKey,
        initialRoute: ROUTE_HOME,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case ROUTE_HOME:
              return MaterialPageRoute(
                builder: (context) => widget.buildHomePage(
                  () => _navigatorKey.currentState.pushNamed(ROUTE_QR_CODE),
                  () => _navigatorKey.currentState.pushNamed(ROUTE_SCANNER),
                ),
              );
            case ROUTE_QR_CODE:
              return MaterialPageRoute(
                builder: (context) => widget.buildQrCodePage(
                  () => _navigatorKey.currentState.pop(context),
                ),
              );
            case ROUTE_SCANNER:
              return MaterialPageRoute(
                builder: (context) => widget.buildScannerPage(
                  () => _navigatorKey.currentState.pop(context),
                ),
              );
            default:
              return throw "No Route found for route name.";
          }
        },
      ),
    );
  }
}
