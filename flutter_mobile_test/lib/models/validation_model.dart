import 'package:json_annotation/json_annotation.dart';

part 'validation_model.g.dart';

@JsonSerializable()
class Validation {
  @JsonKey(name: "is_valid")
  bool isValid;

  Validation(this.isValid);

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}
