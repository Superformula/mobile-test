# Design
This document describes the overall design of the app and the how it is implemented.

## Requirements
The requirements for this app are quite minimal and were specified in QR-generator-test.md. Additional requirements may be added and some may be removed or refined as the project progresses so this is a living document.

- The UI should follow material design.
- Proper navigation between pages.
- Provide visual count down to expiration of QRCode.
- **Optional**: Provide an auto-refresh strategy, for example with the expires_at value.
- **Optional**: Provide an offline QR code access strategy, for example with a cache.
- **Optional**: Build a "Scan" feature that can demonstrate how it works (see the mock) and how it could be validated with another endpoint.

## Visual Design
There are basic mockups of the UI shown in QR-generator-test.md.

## Implementation
This section acts as a spec of sorts. Its a high level overview of the functional parts of the app and implementation notes.

### Outside Dependencies
These are a few key dependencies for this app.

#### QRCodes
Due to the complexity of dealing properly with QR Codes on each platform we use two different 3rd party plugins for dealing with QRCodes. These plugins are in wide use and well maintained.

[qr_flutter](https://pub.dev/packages/qr_flutter) for rendering.

[flutter_barcode_scanner](https://pub.dev/packages/flutter_barcode_scanner) for scanning.

#### HTTP Client
Our server endpoint is accessed via a traditional HTTP Client provided by the Dart standard library.

## Functional Areas
Here we discuss the functional areas of the app and how they should work.

#### Main page
The main page is displayed when the app launches. This page contains a multi select fab button used to select "Scan" or "Generate". In the center of this page is displayed the content of the last image scanned or a placeholder message if no code has been scanned.

##### Scan Page
When "Scan" is selected from the FAB a camera page opens and allows you to scan an existing QRCode.
When the scan is complete the content of the scan (i.e. decoded text) will be displayed in the center of the main screen.

Any errors will be reported via the snackbar.

##### Generate Page
When "Generate" is selected from the FAB the app will query a server for a random seed and expiration date used to generate a new QRCode. The seed text to encode and the expiration date is provided by our backend server.

Once a new QRCode is generated the code image will be displayed in the center of the screen and below will be a text countdown to when the code will expire.

Once the countdown timer expires a new QRCode should be automatically generated and displayed.

The current code image along with its expiration should be cached so that if you quit and relaunch the app and the last code is still valid the screen will open with that code and continue showing the remaing time in the count down. If the cached code has expired then it should be discarded and a new code generated.

#### Validation of Scans
One of the advanced features mentioned was that of validation of a scanned code using an additional server endpoint. We could have the server generate a unique tag in its seed so that when the generated image is decoded the data could be sent to the server for validation.
