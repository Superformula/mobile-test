import 'package:mobile_test/mobile_test.dart';

Future main() async {
  final app = Application<MobileTestChannel>()
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  final count = Platform.numberOfProcessors ~/ 2;
  String ipAddress = '';
  if (Platform.isMacOS) {
     ipAddress =
        Process.runSync('ipconfig', ['getifaddr', 'en0']).stdout.toString().trim();
  }

  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on $ipAddress port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
