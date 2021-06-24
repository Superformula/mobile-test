# qr_generator
This project is an implementation of a QR-generator-test

The project is designed using Domain-Driven Design. The lib folder contains 4 main folders: presentation, application, domain and infrastructure.
![Clean architecture](https://resocoder.com/wp-content/uploads/2020/03/DDD-Flutter-Diagram-v3.svg)

## Getting Started

To run the project
``` console
flutter run lib/main.dart
```

fetch dependencies if needed
``` console
flutter pub get
```


## Testing
To perform unit tests and bloc tests
``` console
flutter test
```

To run integration tests:
``` console
flutter drive --driver=test_driver/integration_test.dart --target=integration_test/app_test.dart
```