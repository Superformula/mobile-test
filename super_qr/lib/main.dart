import 'package:flutter/material.dart';
import 'package:super_qr/ui/home.dart';
import 'package:super_qr/utils/colors.dart';

Future main() async {
  // Any initialization we need to do in the future, we can do here.
  runApp(Application());
}

class Application extends StatefulWidget {
  Application({Key key}) : super(key: key);

  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super QR',
        theme: ThemeData(
            fontFamily: "Roboto",
            primaryColor: SuperColors.purple,
            accentColor: SuperColors.purple,
            inputDecorationTheme: InputDecorationTheme(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: SuperColors.purple.withOpacity(0.25), width: 1)),
              labelStyle: TextStyle(color: SuperColors.purple, fontSize: 24.0),
            ),
            textTheme: TextTheme(
              headline: TextStyle(color: SuperColors.purple),
              button: TextStyle(color: SuperColors.purple),
            ),
            buttonColor: SuperColors.purple,
            disabledColor: SuperColors.lightGrey,
            backgroundColor: SuperColors.lightGrey,
            scaffoldBackgroundColor: SuperColors.canvasColor,
            buttonTheme: ButtonThemeData(buttonColor: SuperColors.purple),
            iconTheme: IconThemeData(color: SuperColors.purple),
            sliderTheme: SliderThemeData.fromPrimaryColors(
              primaryColor: SuperColors.purple,
              primaryColorDark: SuperColors.darkPurple,
              primaryColorLight: SuperColors.lightPurple,
              valueIndicatorTextStyle: TextStyle(color: SuperColors.grey),
            ),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: SuperColors.canvasColor,
              foregroundColor: SuperColors.purple,
            )),
        navigatorObservers: [
          // Normally would be injecting FirebaseAnalytics for navigation.
          // FirebaseAnalyticsObserver(analytics: FirebaseAnalytics())
        ],
        home: HomeView());
  }
}
