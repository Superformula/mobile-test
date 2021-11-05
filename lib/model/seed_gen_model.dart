class SeedGenModel {
  final String seed;
  final String deviceId;
  final int time;
  SeedGenModel({
    required this.seed,
    required this.deviceId,
    required this.time,
  });

  factory SeedGenModel.fromJson(Map<String, dynamic> json) {
    return SeedGenModel(
      seed: json['body']['seed'],
      deviceId: json['body']['id'],
      time: json['body']['time']
    );
  } 
}
