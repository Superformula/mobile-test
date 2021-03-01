part of 'qr_gen_provider.dart';

/// Defines all the QrGen logic the app will use
class QrGenNotifier extends StateNotifier<QrGenState> {
  /// Base constructor expects a [ProviderReference] to
  /// read its usecases and also defines inital state
  QrGenNotifier({
    @required GetSeed getSeed,
    @required GenerateBaseQR generateBaseQR,
  })  : assert(getSeed != null),
        assert(generateBaseQR != null),
        _getSeed = getSeed,
        _generateBaseQR = generateBaseQR,
        super(const QrGenState.initial());

  final GetSeed _getSeed;
  final GenerateBaseQR _generateBaseQR;

  /// Get seed from API use case
  Future<void> getSeed() async {
    state = const Loading();

    final result = await _getSeed();

    result.fold(
      (error) => state = Error(error.toString()),
      _generateQR,
    );
  }

  void _generateQR(Seed seed) {
    final data = BaseDataToEncodeModel(data: seed.seed);
    final qrCode = _generateBaseQR(data);

    state = QRCode(qrPainter: qrCode, expiration: seed.expiresAt);
  }

  /// Expire QR code after expiresAt passes
  void expire() => state = const Expired();

  /// Return to initial state
  void reset() => state = const Initial();
}
