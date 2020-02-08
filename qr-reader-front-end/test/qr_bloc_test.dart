import 'package:flutter_test/flutter_test.dart';
import 'package:superformula/bloc/qr_bloc.dart';

import 'mock_seed_repository.dart';

void main() {
  group('QR BLoC Tests', () {
    test('A QR code is streamed to its listeners after being requested.',
        () async {
      final bloc = QRBloc(MockSeedRepository(value: 'Testing', seconds: 5));
      bloc.qrStream.listen(expectAsync1((seed) {
        expect(seed, isNotNull);
      }));
      bloc.startRequestingCodes();
    });

    test(
        'The BLoC will send countdown events for every second the code should be valid',
        () {
      final bloc = QRBloc(MockSeedRepository(value: 'Count Down', seconds: 2));

      final counters = {'2 seconds', '1 second'};

      bloc.expiryStream.listen(expectAsync1((countdown) {
        expect(counters.contains(countdown), true);

        counters.remove(countdown);

        if (countdown == '1 second') {
          expect(counters.isEmpty, true);
        }
      }, count: 2));
      bloc.startRequestingCodes();
    });
  });
}
