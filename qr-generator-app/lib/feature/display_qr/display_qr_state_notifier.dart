import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/app/providers.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state.dart';
import 'package:qr_generator_app/network/api.dart';

final displayQrStateNotifierProvider =
    StateNotifierProvider<DisplayQrStateNotifier, DisplayQrState>(
        (ref) => DisplayQrStateNotifier(ref.watch(apiProvider)));

class DisplayQrStateNotifier extends StateNotifier<DisplayQrState> {
  final Api _api;

  DisplayQrStateNotifier(this._api) : super(const DisplayQrState.initial());

  Future<void> getSeed() async {
    state = const DisplayQrState.loading();

    await Future.delayed(const Duration(seconds: 2));

    _api.getSeed().then((seed) {
      state = DisplayQrState.success(seed);
    }, onError: (error, stacktrace) {
      state = const DisplayQrState.error();
    });
  }
}
