# QR generator and scan

Mobile Flutter code challenge for Superformula by Juan Manuel Mayobre

## Build Instructions

1. [Install Flutter](https://flutter.dev/docs/get-started/install) on your local machine
2. Run flutter doctor

```
flutter doctor
```

in your CLI to make sure you have all the necessary dependencies. 3. Clone the repo and open the project in your preferred IDE (Android Studio / VS Code) 4. To make sure you get all generated files, run

```
flutter pub get
```

5. Run the app with the

```
flutter run
```

6. Change the `baseUrl` value in `/lib/utils/api_client.dart` depending on the device you are using:
    * iOS Simulator: `'http://localhost:3030'`
    * Android Emulator: `'http://Computer-IP:3030'`


## Tests

Run all unit and widget tests available with the `flutter test` command

## About QR generator coding challenge

This project has a principal page from which you can navigate to another two pages.

1. The first one is the QR generator view. Here, the application retrieves the random ID and time from the server, saves this information in a local database, and shows the QR code and timer to the user. When the timer expires, the application automatically calls the server and refreshes the current data. If there’s no connection, the application will retrieve the information which was saved locally. But once back online, it’ll refresh to the most current data if the timer has expired.
2. The second page is a scan that allows the user to validate the QR code. When the user scans a QR code, the application validates it using an external server and shows the user if it’s “valid” or “invalid”.

In addition, the application includes two advanced requirements: 1) an auto-refresh strategy and 2) an offline QR code data solution.
