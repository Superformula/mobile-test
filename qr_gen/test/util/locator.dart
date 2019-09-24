import 'package:get_it/get_it.dart';
import 'package:qr_gen/core/models/seed.dart';
import 'package:qr_gen/core/state/qr.dart';
import 'package:qr_gen/core/services/qr.dart';
import 'package:qr_gen/core/services/scan.dart';
import 'package:mockito/mockito.dart';

final sl = GetIt.instance;

setupLocator() {
  sl.allowReassignment = true;

  final mockScanService = MockScanService();

  when(mockScanService.scan()).thenAnswer((_) async {
    final seed = Seed.fromJson({
      'seed': '9b0a34057c9d302628e1d7ef50e37b08',
      'expires_at': DateTime.now().add(Duration(seconds: 45)).toIso8601String()
    });
    return seed.encode();
  });

  sl.registerSingleton<ScanService>(mockScanService);
  sl.registerSingleton<QrService>(QrServiceImplementation());
  sl.registerSingleton(QrState());
  sl.registerSingleton(QrActions());
}

setupErrorLocator(ScanServiceErrorCode code) {
  sl.allowReassignment = true;

  final mockScanService = MockScanService();

  when(mockScanService.scan()).thenAnswer((_) => throw ScanServiceError(code));

  sl.registerSingleton<ScanService>(mockScanService);
  sl.registerSingleton<QrService>(QrServiceImplementation());
  sl.registerSingleton(QrState());
  sl.registerSingleton(QrActions());
}

class QrServiceImplementation extends QrService {
  Future<Seed> getSeed() async {
    final seed = Seed.fromJson({
      'seed': '9b0a34057c9d302628e1d7ef50e37b08',
      'expires_at': DateTime.now().add(Duration(seconds: 45)).toIso8601String()
    });
    return seed;
  }
}

class MockScanService extends Mock implements ScanService {}
