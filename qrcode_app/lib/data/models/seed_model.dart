class SeedDto {
  String seed = '0123';
  DateTime expirationDate = DateTime.now().add(Duration(seconds: 10));
  SeedDto(seed, expirationDate);
  SeedDto.fromJson(dynamic json) {
    seed = json['seed'] ?? 'default';
    expirationDate = DateTime.tryParse(json['expiration']) ??
        DateTime.now().add(Duration(seconds: 10));
  }
}
