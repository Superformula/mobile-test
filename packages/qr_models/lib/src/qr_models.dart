// ignore_for_file: sort_constructors_first

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'qr_models.g.dart';

/// {@template qr_models}
/// Representation of the QR code that expires in a determinated time
/// {@endtemplate}
@JsonSerializable()
class QRSeed {
  /// Default constructor with the seed and the expiration time.
  QRSeed(this.seed, this.expiresAt);

  /// Represents the value for the QR code.
  final String seed;

  ///
  final String expiresAt;

  static const _dateFormat = 'yyyy-MM-dd HH:mm:ss';

  /// Returns the expire as [DateTime].
  DateTime get expiresAtDate => DateFormat(_dateFormat).parse(expiresAt);

  /// This returns a [QRSeed] object from json value
  factory QRSeed.fromJson(Map<String, dynamic> json) => _$QRSeedFromJson(json);

  /// This returns a json formatted object with the [QRSeed] information
  Map<String, dynamic> toJson() => _$QRSeedToJson(this);
}

///
extension XQRSeed on QRSeed {
  ///
  bool isExpired() => expiresAtDate.isBefore(DateTime.now());
}
