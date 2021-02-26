# qr_generator_flutter by Elian Ortega

A flutter application that generates a QR Code base on a seed brought from an API.

- ✅  Clean Architecture
- ✅  Testing
- ✅  Performance
- ✅  Custom Animations

## To get started 
```
// To start run the following commands 

git clone [repo_url]

cd qr_generator_flutter

flutter pub get

flutter run --dart-define apiUrl=https://mobile-test-seed-api.herokuapp.com
```
## App Preview
<img src="assets/readme/qr_gif.gif" width=200 height=429/> 
<img src="assets/readme/demo4.PNG" width=200 height=429/> 
<img src="assets/readme/demo5.PNG" width=200 height=429/> 

## Testing
### ✅ Unit Test
![](assets/readme/unit_test.png)
### ✅ Widget Test
![](assets/readme/widget_test.png)
```dart
//run the following command to run the widget test
flutter test
```
### ✅ Integration Test
![](assets/readme/integration_test.png)
```dart
//run the following command to run the integration test
flutter drive --target=test_driver/app.dart --dart-define apiUrl=https://mobile-test-seed-api.herokuapp.com
```

## Project Structure - Clean Architecture

The following diagram represents the clean architecture approach taken to solve this challenge. This was proposed by myself and a friend and was shared with the Hispanic community as a solution to follow clean architecture practices. The original proposal uses `riverpod` but because of the `decoupling` the was no problem on changint to bloc.

With this approach we achieve a great decoupling and separation of concerns between the different layers of the application.

![](assets/readme/clean_scope.jpeg)


## API Node.js
The api for the solution was implemented in node.js and `deploy` to `Heroku` with a single endpoint.
The documentation of it can be found in: https://documenter.getpostman.com/view/14734044/TWDcFZom



This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
