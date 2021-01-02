This is a simple server written using `dart:io` which listens on port 8075. The usage is simple:

- Start the server with `dart run server.dart`
- Get a new seed at [localhost:8075/seed](http://localhost:8075/seed)
- Stop the server at [localhost:8075/stop](http://localhost:8075/stop)

The expiry time of the seed it set to 15 seconds. If you wish, you can easily change it here:

```dart
// other code ...

final seed = generateSeed();
final expiry = DateTime.now().add(const Duration(seconds: 15)); // <- change here

// other code ...
```