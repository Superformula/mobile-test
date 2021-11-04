class SeedModel {
  SeedModel({
    this.id,
    this.expiresAt,
  });

  final String id;
  final DateTime expiresAt;

  SeedModel copyWith({
    String id,
    DateTime expiresAt,
  }) =>
      SeedModel(
        id: id ?? this.id,
        expiresAt: expiresAt ?? this.expiresAt,
      );

  factory SeedModel.fromJson(Map<String, dynamic> json) => SeedModel(
        id: json["id"] == null ? null : json["id"],
        expiresAt: json["expires_at"] == null
            ? null
            : DateTime.parse(json["expires_at"]).toLocal(),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "expires_at": expiresAt == null ? null : expiresAt.toIso8601String(),
      };
}
