class DataSeed {
  DataSeed({required this.data, required this.expiresAt});
  late final String data;
  late final String expiresAt;

  DataSeed.fromJson(Map<String, dynamic> json) {
    data = json['seed'];
    expiresAt = json['expiresAt'];
  }
}
