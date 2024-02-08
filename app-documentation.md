## Overview 📈
This is an app to measure my engineering and development skills.

## Requirements ✅
 - Good use of structure, security, and performance best practices ✓
 - Solid testing approach ✓
 - Extensible code ✓
 - Auto-refresh ✓

## Features ✅
- API Server ✓
    - Developed a simple backend in NodeJS. You can find at _./mobile-test-backend_ folder
- Call the Seed endpoint ✓
    - With the _QrCodeUsecase_ I make the request in my backend retrieving the _QrCodeEntity_ which has the _seed_ and _expiresAt_ variables
- Scan ✓
    - I developed the feature with the package *[qr_code_scanner](https://pub.dev/packages/qr_code_scanner)* and displaying the data to the user
- UI requirements ✓
    - I built the pages and components according with the provided mock-up
- Documentation ✓
    - Described all features and how to execute the code
- Tests ✓
    - All unit and pages tests to ensure the app will work correctly
- Clear commits ✓
    - I'm always writing concise message in my commits to make an easier understanding for who is reading

## App Structure 📱
- To show my knowledge and skills to build an app scalable and maintainable, I developed following the Clean Architechture
- With *[dartz](https://pub.dev/packages/dartz)* I guarantee the error will be handled
- Used best principles, conecpts and patterns were used. For example, S.O.L.I.D, Clean Code, DRY, Return Early, etc...
- BLoC and Cubit for state management
- GetIt to inject my dependecies
- Used Mocktail to make the test coverage over 90%
![test_coverage](https://i.ibb.co/TcgpShC/Screenshot-2024-02-02-at-23-38-44.png)

## Development environment 👨‍💻
- Flutter (Channel stable, 3.16.9, on macOS 13.3.1 22E772610a darwin-arm64, locale en-BR)
- Android toolchain - develop for Android devices (Android SDK version 33.0.2)
- Xcode - develop for iOS and macOS (Xcode 14.2)
- VS Code (version 1.86.0)

## Getting Started 🟢
##### Requirements
- [Flutter](https://flutter.dev/docs/get-started/install) and [NodeJS](https://nodejs.org/en) must be installed on your machine
##### Steps
1. Clone the repository
    ```bash
    git clone https://github.com/leandromichelforte/mobile-test.git
    ```
2. Install Flutter dependencies
    ```bash
    cd mobile-test/
    flutter pub get
    ```
3. Install NodeJS dependencies
    ```bash
    cd mobile-test-backend/
    npm install
    ```
4. Run NodeJS server
    ```bash
    node server.js
    ```
5. In another CLI and with your NodeJS server running, go to the project root folder and run the Flutter app
    ```bash
    flutter run
    ```
##### Tests
- Run the tests
    ```bash
    flutter test --coverage
    ```

## Packages 📦
- [BLoC](https://pub.dev/packages/bloc)
- [Flutter BLoC](https://pub.dev/packages/flutter_bloc)
- [BLoC Test](https://pub.dev/packages/bloc_test)
- [Dartz](https://pub.dev/packages/dartz)
- [Equatable](https://pub.dev/packages/equatable)
- [Mocktail](https://pub.dev/packages/mocktail)
- [Flutter Speed Dial](https://pub.dev/packages/flutter_speed_dial)
- [QR Code Scanner](https://pub.dev/packages/qr_code_scanner)
- [GetIt](https://pub.dev/packages/get_it)
- [QR Flutter](https://pub.dev/packages/qr_flutter)
- [Shimmer](https://pub.dev/packages/shimmer)
- [Dio](https://pub.dev/packages/dio)

## Support and Feedback 📞
If you have any questions or feedback please contact me [leandromichel2306@gmail.com](mailto:leandromichel2306@gmail.com)