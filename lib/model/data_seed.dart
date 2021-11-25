import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'data_seed.g.dart';

@HiveType(typeId: 0)
class DataSeed extends HiveObject {
  DataSeed({required this.data, required this.expiresAt});
  @HiveField(0)
  late final String data;
  @HiveField(1)
  late final String expiresAt;

  DataSeed.fromJson(Map<String, dynamic> json) {
    data = json['seed'];
    expiresAt = json['expiresAt'];
  }
}
