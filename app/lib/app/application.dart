import 'package:flutter/material.dart';
import 'package:qrgenerator/app/intl/app_strings.dart';
import 'package:qrgenerator/app/ui/generate/generate.dart';
import 'package:qrgenerator/app/ui/home/home.dart';

Widget buildApp() {
  return Application();
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Don't show the debug banner.
      debugShowCheckedModeBanner: false,

      // MaterialApp creates a Localizations widget with the specified delegates.
      // AppStrings.of() will find the app's Localizations widget if its context is
      // a child of the app.
      // Usage: To access localized strings in UI code...
      // final strings = AppStrings.of(context);
      // strings.someStringName;
      onGenerateTitle: (BuildContext context) {
        return AppStrings.of(context).appName;
      },
      localizationsDelegates: AppStrings.localizationsDelegates,
      supportedLocales: AppStrings.supportedLocales,
      localeResolutionCallback: AppStrings.localizationCallback,

      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the HomwPage widget.
        '/': (context) => buildHomePage(),
        '/generate': (context) => buildGeneratePage(),
      },
    );
  }
}
