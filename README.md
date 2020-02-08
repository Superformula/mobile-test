# Superformula Mobile Developer Coding Test

Make sure you read **all** of this document carefully, and follow the guidelines in it.

# About

This repo contains two seperate projects, the front and backend for the QR generator.

## Backend - Aqueduct

The backend was written using a Dart framework called Aqueduct.  Aqueduct was chosen simply to keep a single language for the entire project.  There is an instance of this backend that has been deployed to Heroku, but it can also be spun up locally.

To run the backend, first make sure you download Aqueduct
`pub global activate aqueduct`

Afterwards simply run the backend with the command
`aqueduct serve`

The local version of the backend works perfectly for front end development on a simulator/emulator, but it is more challenging to work with on actual devices, subsequently, the Flutter app points to a Heroku instance of the Aqueduct project.

When running the app, please keep in mind that the Heroku instance is not configured for production quality.  Heroku periodically puts free instances to sleep and there will be a warm up period for the first network call.  Aftwards there shouldn't be any delay.

## Front End - Flutter App

The Flutter app has two pages, one for rendering QR codes and the other for scanning them.

For the scanning page, it is recommend to us an actual device instead of the iOS simulator/ Android emulator. The will likely throw a unavoidable exception on the simulator since there is no camera.

For the QR Rendering Page, the BLoC pattern was employed for interfacing with the backend and controlling the business logic.  BLoC allows the constant changes of the QR code and the expiration count down to be streamed to widget.  This way the widget layer is only conserned with layout, not business logic.

The scanning page, however, is just a simple StatefulWidget that does not require any advanced architecture.

## Testing Strategy

The app is fairly simple, so there wasn't much need for excessive unit tests.  The one are that required special attention was the QR BLoC.  This class was designed to allow the network layer to be replaced with a mock.  You don't want to hit the actual API in a testing suite.

The only two tests check if the streams are emitting the expected events since this is the one area of the BLoC pattern  that could be considered fragile.