import 'package:meta/meta.dart';

class QrSeed {
  final String seed;
  final DateTime expiration;
  final int seconds;

  const QrSeed({
    @required this.seed,
    @required this.expiration,
    @required this.seconds,
  })  : assert(seed != null),
        assert(expiration != null),
        assert(seconds != null);

  factory QrSeed.fromJson(Map json) {
    final seed = json['seed'];

    // Building the expiration on the front end since the backend can returning a wildly
    // different timestamp based on where ever the server might be hosted
    final seconds = json["seconds"];
    final date = DateTime.now().add(Duration(seconds: seconds));

    return QrSeed(
      seed: seed,
      expiration: date,
      seconds: seconds,
    );
  }

  Duration get validDuration => expiration.difference(DateTime.now());
}
