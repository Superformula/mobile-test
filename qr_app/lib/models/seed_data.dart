import 'dart:convert';

import 'base_model.dart';

class SeedData extends BaseModel {
  final String seed;
  final String dateTime;
  SeedData({
    this.seed,
    this.dateTime,
  });

  DateTime get dateTimeObject => DateTime.parse(dateTime);

  SeedData copyWith({
    String seed,
    String dateTime,
  }) {
    return SeedData(
      seed: seed ?? this.seed,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'seed': seed,
      'dateTime': dateTime,
    };
  }

  factory SeedData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SeedData(
      seed: map['seed'],
      dateTime: map['dateTime'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SeedData.fromJson(String source) =>
      SeedData.fromMap(json.decode(source));

  @override
  String toString() => 'SeedData(seed: $seed, dateTime: $dateTime)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SeedData && o.seed == seed && o.dateTime == dateTime;
  }

  @override
  int get hashCode => seed.hashCode ^ dateTime.hashCode;
}
