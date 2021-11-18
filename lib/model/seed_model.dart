import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'seed_model.g.dart';

@HiveType(typeId: 0)
class Seed extends HiveObject {
  Seed({
    required this.seed,
    required this.expiresAt,
  });
  @HiveField(0)
  late final String seed;
  @HiveField(1)
  late final String expiresAt;

//Creates a new seed by mapping a json response from the server to a new seed object
  Seed.fromJson(Map<String, dynamic> json) {
    seed = json['seed'];
    expiresAt = json['expiresAt'];
  }
}
