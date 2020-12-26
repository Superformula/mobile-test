import 'package:equatable/equatable.dart';

class Seed extends Equatable {
  final String id;
  final String seed;
  final DateTime expiresAt;

  Seed({
    this.id,
    this.seed,
    this.expiresAt,
  });

  bool isValid() {
    return DateTime.now().isBefore(expiresAt);
  }

  static Seed fromJson(Map json) {
    String expiresAtIso = json['expires_at'];
    return Seed(
      id: json['_id'],
      seed: json['seed'],
      expiresAt: expiresAtIso != null ? DateTime.parse(expiresAtIso) : null,
    );
  }

  @override
  String toString() {
    return 'Seed { id: $id, seed: $seed, expiresAt: $expiresAt }';
  }

  @override
  List<Object> get props => [
        seed,
        expiresAt,
      ];
}
