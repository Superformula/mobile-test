
import 'package:equatable/equatable.dart';

class QRCodeViewModel extends Equatable {
  final String seed;
  final DateTime? expiresAt;

  const QRCodeViewModel({
    required this.seed,
    this.expiresAt,
  });

  @override
  List<Object?> get props => [seed, expiresAt];
}
