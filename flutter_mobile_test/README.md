# Superformula test submission 

The purpose of this repository is to demonstrate a client's request to generate and scan QR Codes.

## Running the server

This server has been created by Brian Blanchard and shared with me.

### Prerequisites
- node.js version `v12.2.0` is installed

### Instructions
- All commands are run from within the `server/` directory
1. Run `npm install`
2. Run `node index.js`

## Running the app

First, please edit **_baseUrl** field in **HttpClient** class with the address used by the server.
Type in `flutter run` while being in the **flutter_mobile_test** directory to run the app or, type `flutter test` to run unit tests.

## Structure

This application is organized into packages representing functionalities. Also, it has been designed to incorporate BLoC pattern.

### Api

Package api includes classes needed for network calls.

### Barcode

This package contains wrapper class for the Barcode scanner.

### Locator

Contains setup of Service Locator.

### Models

Contains classes representing data coming form API: QrCode and Validation.

### Pages

In every subpackage there are Widgets representing screens: Home, Scanner and QrCode, along with BLoC classes containing logic for each of them.

### Repository

Contains class responsible for storing data coming from network requests. 