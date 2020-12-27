# QR Code app

A Flutter app that communicates with a Node.js API to generate and scan QR codes.

## Getting Started
QR Code is created with Flutter. Installation instructions for Flutter can be found [here](https://flutter.dev/docs/get-started/install).

### Running the project

## API Server
1. Navigate to the `/api` directory.
2. Run `npm install`. 
3. Run `npm run start`. The API server should be running on port 3000.

## Flutter App
1. Before running the mobile app, please ensure you are using the latest stable Flutter channel:
    ```
    flutter channel stable
    flutter upgrade
    ```
    This app was developed on Flutter stable channel 1.22.5

2. Clone this repo.
3. Change the `apiUrl` value in `/lib/repositories/qr.dart` depending on the device you are using:
    * iOS Simulator: `'http://localhost:3000'`
    * Android Emulator: `'http://10.0.2.2:3000'`
    * Real Device: Run `ifconfig` to determine your IP address, and set the value to `'http://<your_ip>:3000'`
3. Open an emulator and run `flutter run` in the root of the project, or run directly from Android Studio

### App Structure
* Business logic is managed with the [bloc](https://bloclibrary.dev/#/) library. All blocs / cubits are located in `/lib/blocs`. [flutter_bloc](https://pub.dev/packages/flutter_bloc) widgets are used in the frontend to handle state changes.

* API wrappers are contained in `/lib/repositories`. Instances of these repositories are declared in /lib/main.dart using RepositoryProviders so that these repositories can be used by any bloc in the application. Repositories should only be accessed by cubits / blocs.

* Tests are written using the flutter_test library and can be run using `flutter test test/<file>.dart`. Test files are located in `/test`.
[Testing Flutter apps](https://flutter.dev/docs/testing)

* All screens are located in `/lib/screens`.
