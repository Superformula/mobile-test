# QRCode Scan Application

### Table of Contents
  - [Setup for Mac](#setup-for-mac)
    - [Homebrew](#homebrew)
    - [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com)
    - [Xcode]
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
   
   Run the app
   flutter run
   
   #Unit Test
   flutter test test/yourtestfile.dart
   
   #Golden test for one particular file 
   flutter test --update-goldens <path_to_test_file>
   To run all
   flutter test

## Build API 

Install node
Express router
Install npm


