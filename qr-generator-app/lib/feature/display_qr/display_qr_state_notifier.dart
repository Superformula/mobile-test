import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/app/providers.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state.dart';
import 'package:qr_generator_app/model/qr_data.dart';
import 'package:qr_generator_app/network/api.dart';

final displayQrStateNotifierProvider =
    StateNotifierProvider<DisplayQrStateNotifier, DisplayQrState>(
        (ref) => DisplayQrStateNotifier(ref.watch(apiProvider)));

class DisplayQrStateNotifier extends StateNotifier<DisplayQrState> {
  final Api _api;

  DisplayQrStateNotifier(this._api) : super(const DisplayQrState.initial());

  Future<void> getSeed() async {
    state = const DisplayQrState.loading();
    try {
      final QrData qrData = await _api.getSeed();
      state = DisplayQrState.success(qrData);
    } catch (error) {
      state = const DisplayQrState.error();
    }
  }
}
