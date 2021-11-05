import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sf_qr_code/features/qr/models/seed_response.dart';
import 'package:sf_qr_code/features/qr/repo/qr_repo.dart';

part 'qr_event.dart';
part 'qr_state.dart';

class QrBloc extends Bloc<QrEvent, QrState> {
  final QrRepository _qrRepository;
  QrBloc({QrRepository? qrRepository})
      : _qrRepository = qrRepository ?? QrRepository(qrDataProvider: null),
        super(QrInitialState());

  @override
  Stream<QrState> mapEventToState(
    QrEvent event,
  ) async* {
    if (event is QrSeedRequestEvent) {
      yield* _qrSeedRequestEvent(event);
    }
  }

  Stream<QrState> _qrSeedRequestEvent(QrSeedRequestEvent event) async* {
    yield QrSeedUnlikeState(state); // state change detection
    try {
      SeedResponse seedResponse = await _qrRepository.fetchQRSeedData();
      // yield the successful state stream
      yield QrSeedResponseSuccessfulState( seedData: seedResponse);
    } catch (e) {
      // yield the unsuccessful state stream
      yield QrSeedResponseUnsuccessfulState(
          message: "There is some problem occured, please try later");
    }
  }
}
