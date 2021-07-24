# QR Test Demo - Flutter Project (Android/iOS)

Flutter project that has 2 features:
1. Read QR Code
2. Generate a new QR Code

## Backend
I've created an AWS lambda endpoint in order to generate this QR Code seeds:

* endpoint: https://osfejxnyib.execute-api.us-east-1.amazonaws.com/prod/
* path: /seed
* query params: value

Example:
* https://osfejxnyib.execute-api.us-east-1.amazonaws.com/prod/seed?value=%22Hello!%20Pablo%22
* https://osfejxnyib.execute-api.us-east-1.amazonaws.com/prod/seed?value=testing

Note: The endpoint returns the same value that you send in the "value" parameter so the app can consume it.

## Minimun Requirements
Android Studio 4.2+

## Architecture
The project simulates a clean architecture, the right way to do this is creating one module for each layer but because the application was pretty small use a package instead of a module works great.

- domain (business logic)
- core (shared-data)
- data (network, db, etc)
- features (pages, etc)

## Testing
The project includes general testing but a lot of testing is still missing, the idea here is just to have some basic testing files to get a feel of how to do it. Like unit-testing, bloc testing, widget testing and golden files.

## Lint
Lint rules are not applied for this demo project

## Error Handling
1. Errors like network connections or bad data are handled using a generic bloc state

## General Notes

1. The app has an array of possible strings that are used for the seed endpoint.
2. Routing was no necessary so a simple router was used
3. We used Bloc + Freezed in order to get some inmutability benefits but freezed package is not required

## Screenshots
![](https://github.com/pablopantaleon/qrcode_flutter_demo/blob/master/screenshots/1.jpg)
![](https://github.com/pablopantaleon/qrcode_flutter_demo/blob/master/screenshots/2.jpg)
![](https://github.com/pablopantaleon/qrcode_flutter_demo/blob/master/screenshots/3.jpg)