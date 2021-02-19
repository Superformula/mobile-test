![App preview][0]

## Get Started

Setup your flutter environment following [the official documentation][1].

### Auto-generated code

This project uses some libraries that rely on code generation through the [build_runner][2] package. Hence, it's recommended to begin with by running the following command:

```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Running the app

Once the code generation is complete, the app can be executed by running:

```bash
flutter run
```

## Architecture

This project makes use of the [Redux][3] and [flutter_redux][4] libraries for state management. The app's state is split into `SeedState` and `ValidationState`. Each sub-state supports a different flow in the app.

- `SeedState`: used by the QR Code generation feature
  - idle: initial state. Means the feature hasn't been used yet
  - inProgress: signals that there's a request in progress to fetch a new seed from the backend
  - loaded: seed has been successfully loaded from the backend.
  - error: used whenever any error happens while fetching a seed. This could a network error, a server error, or any  `Exception`.


- `ValidationState`: supports the scanner flow
  - idle: initial state
  - inProgress: a request to validate a QR code with the backend is in progress
  - validCode: the scanned code has been verified by the backend, and it's a valid one
  - expiredCode: the scanned code has already expired
  - error: used whenever an error happens during the validation process


### Middlewares

The Redux architecture dictates that `Reducer` functions must remain pure, and any side-effects are supposed to happen in separate `Middleware` classes. In this project, there are two custom Middlewares in use.

- `ApiMiddleware`: runs in response to `FetchSeed` and `ValidateQrCode` actions. It talks to `ApiClient` to make the appropriate API calls
- `AutoRefreshMiddleware`: listens to `SeedLoaded` actions, and dispatches a `FetchSeed` action when the loaded seed expires. It can be turn on/off via `TurnOnAutoRefresh` and `TurnOffAutoRefresh` actions

## Testing
This application was almost entirely built using Test-Driven Development. The exceptions to this rule were due to time constraints, like the `ApiClient` class, or to the nature of the feature, like the QR code scanner.

Tests are divided in:
- Unit tests
  - Non-UI code, like `Reducer` and `Middleware`, are tested with standard Dart unit tests
- Widget "unit" tests
  - Widgets, like the `CountDownWidget`, can be tested in isolation to verify they display the correct information and trigger the right events/actions. In these tests, we mock all dependencies (if needed), and use fake redux stores without any middlewares
- Widget "Integration" tests
  - These are broader tests meant to verify that different components of the app work well together. These tests mount entire pages with all their "production" dependencies, and only the `ApiClient` can be mocked.
- End-to-end tests
  - Tests that run on a real or virtual device (they are mainly called [integration tests][15] in Flutter's documentation).
  - Since the business logic and data flows are already covered by the other tests, we don't need many e2e tests, and use them sparely

### Running tests

To execute the e2e tests, make sure to have a connected device (real or simulator), and run the following command:

```bash
flutter drive --driver=test/e2e/e2e.dart --target=test/e2e/app_test.dart
```

For all other tests do:

```bash
flutter test
```

## Known-bugs
- [ ] Auto-refresh stops working if app in background - this can be solved using `WidgetsBindingObserver`

## Credits

The following assets are used in the app:
- [QR Code][5] present in the icon - made by [Freepik][6] from [Flaticon][7]
- Illustration for [valid code][8] - [by Freepik Storyset][9]
- Illustration for [expired code][10] - [by Freepik Storyset][9]
- Illustration for [generic error][11] - [by Freepik Storyset][9]
- [Photo][12] used in the banner to illustrate the scan feature - by [Apollo Photography][13] on [Unsplash][14]

<!-- Links -->
[0]: about.png
[1]: https://flutter.dev/docs/get-started/install
[2]: https://pub.dev/packages/build_runner
[3]: https://pub.dartlang.org/packages/redux
[4]: https://pub.dartlang.org/packages/flutter_redux
[5]: https://www.flaticon.com/free-icon/qr_1287558?term=qr&page=1&position=2&page=1&position=2&related_id=1287558&origin=search
[6]: https://www.freepik.com
[7]: https://www.flaticon.com
[8]: https://storyset.com/illustration/high-five/bro
[9]: https://storyset.com/people
[10]: https://storyset.com/illustration/504-error-gateway-timeout/bro
[11]: https://storyset.com/illustration/error-429/bro
[12]: https://unsplash.com/photos/jukKJSr9FcA
[13]: https://unsplash.com/@apollophotog?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText
[14]: https://unsplash.com/s/photos/qr?utm_source=unsplash&amp;utm_medium=referral&amp;utm_content=creditCopyText
[15]: https://flutter.dev/docs/testing/integration-tests
