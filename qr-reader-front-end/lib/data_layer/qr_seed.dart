import 'package:meta/meta.dart';

class QrSeed {
  final String seed;
  final DateTime expiration;

  const QrSeed({
    @required this.seed,
    @required this.expiration,
  })  : assert(seed != null),
        assert(expiration != null);

  factory QrSeed.fromJson(Map json) {
    final seed = json['seed'];
    final dateString = json['expires_at'];
    final date = DateTime.parse(dateString);
    return QrSeed(
      seed: seed,
      expiration: date,
    );
  }

  Duration get validDuration => expiration.difference(DateTime.now());
}
