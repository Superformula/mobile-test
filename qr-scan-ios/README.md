# QR Scan Readme

![QR Scan](https://i.imgur.com/Y9DJYoH.png)

### Configuration

1.) Clone the [mobile-test](https://github.com/kalub92/mobile-test) repo

2.) Open `qr-scan-ios.xcodeproj`

3.) Build app to simulator/device

### Design

#### ScanQRViewController

`ScanQRViewController` imports `AVFoundation` and relies upon an instance of `AVCaptureSession` & `AVCaptureVideoPreviewLayer`. Conformance to the `AVCaptureMetadataOutputObjectsDelegate` protocol and the use of `metadataOutput(_:didOutput:from:)` allows me to scan through the found `AVMetadataObject` instances and check to see if they are machine readable. If they are, we call the `found(code:)` function and set the text of the UILabel to the processed text. If the device is ineligible for scanning QR codes (lack of camera), the `failed()` function is called which presents a UIAlertController and sets the `captureSession` to nil.

#### GenerateQRViewController

`GenerateQRViewController` shows a `UIActivityIndicatorView` upon being presented while calling `loadQRCodeSeed(withCompletion:)` from the `NetworkController` class. This function essentially make a GET request to the provided Lambda endpoint, passing in the API key header. The data that is returned is serialized as JSON and the randomly generated value for the `"seed"` key is passed in to the completion handler to be used. The function `generateQRCode(from:)` function is then called from the `QRGenerator` class. This function essentially converts a string into data using ASCII encoding. A `CIFilter` is then used to set a value for the key `"inputMessage"`. The `outputImage` property of the `CIFilter` is then transformed to be a bit larger and returned as a `UIImage`. This is the returned QR code for the given data.

### Other (Potential) Functionality

While I have yet to explore adding these features, this is how I imagine it could be done.

#### Auto-Refresh

An auto-refreshing seed could be managed by setting an `NSTimer` based on the expiration time downloaded when the lambda endpoint is called. When the timer expires, the lambda endpoint could be pinged again and all data refreshed and regenerated.

#### Caching

Offline QR code functionality could be provided with a tool like Realm. The seed data and expiration could be stored and used to compare against the current datestamp. The expiration time could be used to both clear the cache and present a message that the user needs to re-connect to sync and generate a new code.

#### Validation

A tool like CryptoSwift could allow for the hashing of QR code seeds and decryption with a password or some type of cipher.
