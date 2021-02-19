# QRCode Scan Application

### Table of Contents
  - [Setup for Mac](#setup-for-mac)
    - [Homebrew](#homebrew)
    - [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com)
    - [Xcode](#Xcode)
    - [Flutter](https://flutter.dev/docs/get-started/install/macos)
    - [Build and Run the Application](#build-and-run-the-application)

Flutter
   Download the latest SDK.

   Extract the zip to your development workspace like the example below:
   cd ~/workspace

   unzip downloaded zip.
   Add flutter to your PATH variable in your .bash_profile
   export PATH=$PATH:~/workspace/flutter/bin

   Note: Make sure to refresh your environment variables using the command source ~\.bash_profile.

   Run flutter doctor.
   This will tell you what else is missing from your environment and provide instructions to resolve those issues.
   Download Dart SDK(https://dart.dev/get-dart)    

Build and Run the Application
   Checkout this project from GitHub to your workspace
   git clone https://github.com/Nagadivyabikkina/mobile-test.git

   Navigate to the project directory
   cd mobile-test/

   #Run the app
   flutter run

   #Build APK or IPA
   flutter build apk --release -t lib/main.dart
   flutter build ios --release -t lib/main.dart

   #Dart Analyzer
   To check linters added analysis_options.yaml file

   #Unit Tests
   flutter test
   flutter test test/yourtestfile.dart

   #Golden tests for one particular file
   flutter test --update-goldens <path_to_test_file>
   To run all
   flutter test

   #Integration Tests
   Add dependency flutter_driver in pubspec.yaml file. Follow flutter reference:
   https://flutter.dev/docs/cookbook/testing/integration/introduction

   #Test Coverage
   Run: flutter test --coverage which generates lcov.info path_to_test_file
   Run: genhtml coverage/lcov.info --output-directory coverage to generate html file in readable format.
   If genhtml is not installed run brew install genhtml

## Build API

  Install node
  Express router
  Install npm
  Follow documentation at https://stackabuse.com/building-a-rest-api-with-node-and-express/ to build and deploy quickly API on heroku.
  Getting Started on Heroku with Node.js
  https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up

##Now its time to go for some coding...(About App):
  You need to create a new flutter Project with choice of your name. You need to add some plugins named as:
  A. barcode_scan
  B. qr_flutter
  This project is build with MVVM design pattern and provides the user with capabilities of generating Qrcode and scanning it.
  1.Entire project is divided into three modules:
        •	Home Screen
        •	QR code generator screen
        •	QR code scanner screen
  2.Home Screen will render a floating action button, on tap will show menu items list from which user can make a selection to generate QR code or navigate into scanner screen for scanning the QR code generated earlier.
  3.Tap on QR code labeled icon will push new screen with loader while loading data and eventually display QR code with count down timer.
  4.User can tap on “Qr code expired try another” button to refresh and get new QR code with remaining time showing.
  5.Tap on QR Scan labeled icon will push new screen with scanner that will be able to scan QR code and display scanned result.
  6.User can tap on “Try Another QR code” button to be able to scan another QR code. All different use cases are covered in case of permission issue or errors.
