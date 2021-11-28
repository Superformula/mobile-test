import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qr_generator_app/feature/display_qr/display_qr_state.dart';

final displayQrStateNotifierProvider =
    StateNotifierProvider<DisplayQrStateNotifier, DisplayQrState>(
        (_) => DisplayQrStateNotifier());

class DisplayQrStateNotifier extends StateNotifier<DisplayQrState> {
  DisplayQrStateNotifier() : super(const DisplayQrState.initial());

  Future<void> getSeed() async {}
}
