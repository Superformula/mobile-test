import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart';

import 'package:network_manager/network_manager.dart';
import 'package:qr_code_gen/qr_code_gen.dart';
import 'package:qr_gen/qr_gen.dart'
    show GetSeed, IQrGenRepository, QrGenRepository, DioDataSource, Seed;

import '../../../core/env/environment_config.dart';

import 'qr_gen_state.dart';

part 'qr_gen_state_notifier.dart';

/// * Repositories Providers
final _qrGenRepositoryProvider = Provider<IQrGenRepository>(
  (_) {
    const url = EnvironmentConfig.apiUrl;

    return QrGenRepository(
      networkManager: NetworkManager(DataConnectionChecker()),
      remoteDataSource: DioDataSource(
        client: Dio(),
        url: '$url/api/seed',
      ),
    );
  },
);

/// * Use Cases Providers
final _getSeedProvider = Provider<GetSeed>(
  (ref) {
    final repository = ref.watch(_qrGenRepositoryProvider);
    return GetSeed(repository: repository);
  },
);

/// * Provider to use the QrGenStateNotifier.
final qrGenNotifierProvider = StateNotifierProvider<QrGenNotifier>(
  (ref) {
    final getSeed = ref.watch(_getSeedProvider);
    final generateQr = GenerateBaseQR(QRGeneratorService());

    return QrGenNotifier(getSeed: getSeed, generateBaseQR: generateQr);
  },
);
