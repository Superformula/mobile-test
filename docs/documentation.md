![superformula_link]



# Documentation
Below you can find all the information about the application.

## Setup ⚙️
- This app was built with the Flutter version 3.10.3.
- To run the application, execute `make get`

## Features 🎯
- Home page
- QR Code page
- QR Code Scan page
- Auto refresh strategy

# API
- I built a simple API using Dart Frog to get the `/seed` endpoint. This API can be found in: [QR Server](https://github.com/dionesxxx/qr_server)
- I deployed this API using Google Cloud. The domain is : https://superformula-eegnmdthqa-ue.a.run.app/seed

## Architecture

![architecture]

- Data layer: This layer interacts directly with an API (REST API or a device API).
- Domain layer: This layer transforms or manipulates the data that the API provides.
- Presentation layer: This layer presents the app content and triggers events that modify the application state.

The app was built to support packages, whenever you need a new repository you will create a new package to keep all dependencies consistent.
The packages are as much simple as possible, so you have a finer-grained dependency control. Since each package has a separate pubspec.yaml.
In additiona it will be easy to all teams follow the pattern in the package approach.

## Application
The application follow the patter page/view, each feature contains the patter feature_page.dart and feature_view.dart

```
├── lib
|   ├── app
│   │   ├── view
│   │   │   └── app.dart
│   │   ├── view.dart
|   ├── scan
│   │   ├── cubit
│   │   │   └── scan_cubit.dart
|   |   |   └── scan_state.dart
│   │   └── view
│   │   |   ├── scan_page.dart
│   │   |   └── scan_view.dart
|   |   |   └── view.dart
|   |   └── widgets
|   |   |   └── widgets.dart
│   │   ├── scan.dart
│   ├── bootstrap.dart
│   └── main.dart
├── pubspec.lock
├── pubspec.yaml
```

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
  "home": "Home",
  "@home": {
    "description": "The home title"
  },
  "scan": "Scan",
  "@scan": {
    "description": "The scan title"
  },
  "qrCode": "QRCode",
  "@qrCode": {
    "description": "The qr code title"
  }
}
```

2. Then add a new key/value and description

```arb
{
    "home": "Home",
    "scan": "Escanear",
    "qrCode": "QRCode"
}
```

3. Use the new string

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@override
Widget build(BuildContext context) {
  final appLocalizations = AppLocalizations.of(context);
  return Text(appLocalizations.scan);
}
```

## Tests
- To run the tests `make testing`

## External packages
- http: Network API calls.
- flutter_bloc: State Management
- bloc_test: useful package that helps to test bloc instances
- equatable: useful to compare classes
- qr_flutter: To create the QR Code
- mobile_scanner: To scan a QR Code
- equatable: To help with value based equality
- mockatail: Useful for mock in testing


[superformula_link]: https://avatars.githubusercontent.com/u/415147?s=200&v=4
[architecture]: ../docs/folders.png
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
