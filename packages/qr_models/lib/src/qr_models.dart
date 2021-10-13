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

  /// Represent the expiration time of the seed
  final String expiresAt;

  /// Returns the expire as [DateTime].
  DateTime get expiresAtDate => DateFormat(dateFormat).parse(expiresAt);

  /// This returns a [QRSeed] object from json value
  factory QRSeed.fromJson(Map<String, dynamic> json) => _$QRSeedFromJson(json);

  /// This returns a json formatted object with the [QRSeed] information
  Map<String, dynamic> toJson() => _$QRSeedToJson(this);
}

/// Date format given from the server
const dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";

/// Some useful extension for [QRSeed]
extension XQRSeed on QRSeed {
  /// Determinte if a seed is expired or not.
  bool isExpired() => expiresAtDate.isBefore(DateTime.now());

  /// Returns the difference in seconds between the expire date of a [QRSeed]
  /// with the actual time.
  int differenceInSeconds() =>
      expiresAtDate.difference(DateTime.now()).inSeconds;
}
