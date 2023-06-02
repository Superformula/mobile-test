import 'package:equatable/equatable.dart';

/// {@template qr_code}
/// A single `qr code` item.
///
/// Contains a [seed], [expiresAt].
///
/// {@endtemplate}
class QrCode extends Equatable {
  /// {@macro qr_code}
  const QrCode({
    required this.seed,
    this.expiresAt,
  });

  /// The unique identifier of the `qr code`.
  final String seed;

  /// The expires date of the `qr code`.
  final DateTime? expiresAt;

  @override
  List<Object?> get props => [seed, expiresAt];
}
