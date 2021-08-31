import 'package:freezed_annotation/freezed_annotation.dart';

part 'qr_model.freezed.dart';

part 'qr_model.g.dart';

@freezed
abstract class QrModel with _$QrModel {
  const QrModel._();
  const factory QrModel({
    String? seed,
    String? expiresAt,
    
  }) = _QrModel;

  factory QrModel.fromJson(Map<String, dynamic> json) =>
      _$QrModelFromJson(json);


      
}
