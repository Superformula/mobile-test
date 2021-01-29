# QR Code validator

![CI](https://github.com/edgarfroes/mobile-test/workflows/CI/badge.svg?branch=master)

An app with QR Code generator and scanner, with auto-refresh and QR Code validationa.

# Setup
[Install and run Flutter](https://flutter.dev/docs/get-started/install).

Create the file `.env` in the `src` folder with the following template:
```
API_URL=YOUR_API_URL
API_KEY=YOUR_API_KEY
```

Test, build and run the app.

## Structure
This project follows the [Clean Architecture pattern described by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html), leveraging the guidelines presented in the [flutter_clean_architecture](https://pub.dev/packages/flutter_clean_architecture) library for maintaining the architecture.


# About the app

## How to use
This project consists in 3 screens: **Home**, **Scan** and **QR Code**.

The **Home** screen consists on a single button that expands into two more buttons that will redirect the user to the other screens.
The **Scan** screen os for scanning the QR Code on other devices in order to check them for validity.
The **QR Code** screen generates valid QR Codes and display the expiration of the current QR Code being shown. After expiration, the screen will auto-renew the QR Code with a new 