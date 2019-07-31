# QR Generator

Superformula mobile test of QR code generator.

## Other Documents

**The architecture of the app is described in ARCHITECTURE.md**

**The design of the app us described in DESIGN.md**

## Getting Started

### Dev Environment

- MacOS High Sierra or later
- Windows 10 or later
- VSCode 1.36 or later
- Xcode 9 or later
- Android SDK API 21 (Android 5.0)
- Git

### VSCode Required Plugins
- Dart
- Flutter

### VSCode Recommended Plugins
- Markdown Preview Github

#### Install VSCode
Install VSCode and install Dart and Flutter plugins.

#### Set the Flutter master channel
Before building app make sure you are on the correct flutter channel.

Open terminal and cd to your app's root directory.

type:
```
flutter channel master
```
This will switch your flutter to the master branch for development.

### Checking your install of Flutter

At any time you can check the status of your Flutter installation.

This is also useful if you need to report a Flutter bug.

type:

```
flutter doctor
```

## Building

To build and install on tethered device you don't need to launch VSCode.

You can build from the command line

type:
```
flutter build <ios|apk>
flutter install <ios|apk>
```

### Cleaning

You can clean your flutter build

type:
```
flutter clean
```

### Installing

To install on a tethered device or emulator

type:
```
flutter install <ios|apk>
```

If you have multiple devices connected then you need to specify a device id

type:
```
flutter install apk -d emulator-5556
```
