import 'dart:convert';

class SeedData {
  final String seed;
  final String dateTime;
  SeedData({
    this.seed,
    this.dateTime,
  });

  int retrieveTimeSpan() {
    return DateTime.parse(dateTime)
        .difference(
          DateTime.now(),
        )
        .inSeconds;
  }

  factory SeedData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SeedData(
      seed: map['seed'],
      dateTime: map['dateTime'],
    );
  }

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
