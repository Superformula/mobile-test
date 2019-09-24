# superformula monorepo

The purpose of this repository is to demonstrate a client's request to generate and scan QR Codes.

## Getting Started

From the api folder run `yarn`.

From the qr_gen folder, run `flutter pub get`

### Running the api

The api can be ran using the `yarn start` or `npm run start` commands from the **api** folder.

From the api folder, run `yarn start` in your terminal.

To run the api tests, run `yarn test` in your terminal.

### Running the app

From the **qr_gen** directory, run `flutter run` in your terminal.

To run the app tests, run `flutter test` in your terminal.

## Design

The qr_gen application is organized into two main folders: core and ui.

### Core

Core includes the application business logic such as models, services, and state.

#### Models

Seed - the seed model serlializes the request from the server.

#### Services

QrService - Retrieves seed from api

ScanService - Wraps barcode_scanner library with application specific functionality and error handling.

#### State

QrState - Keeps track of loading state and seed data

QrActions - Allows retrieval of seed data

### UI

UI includes application screens and shared widgets.

#### Screens

HomeScreen - Landing screen of application

ScannerScreen - Screen to scan Qr Codes

GeneratorScreen - Screen to generate Qr Codes from seed data

#### Shared

ExpiryPanel - Handles dispaly of expiry as well as refresh
