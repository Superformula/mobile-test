import 'package:equatable/equatable.dart';

class QrCodeSeedViewModel extends Equatable {
  final String seed;
  final DateTime? expiresAt;

  const QrCodeSeedViewModel({
    required this.seed,
    this.expiresAt,
  });

  @override
  List<Object?> get props => [seed, expiresAt];
}
