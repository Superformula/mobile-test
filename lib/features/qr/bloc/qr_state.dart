part of 'qr_bloc.dart';

abstract class QrState extends Equatable {
  final SeedResponse? seedData;
  const QrState({this.seedData});

  @override
  List<Object> get props => [];
}

class QrInitialState extends QrState {}

class QrSeedResponseSuccessfulState extends QrState {
  QrSeedResponseSuccessfulState( {required SeedResponse seedData})
      : super(seedData: seedData);
}
class QrSeedUnlikeState extends QrState {
  QrSeedUnlikeState(state,)
      : super(seedData: state.seedData);
}

class QrSeedResponseUnsuccessfulState extends QrState {
  final String message;
  QrSeedResponseUnsuccessfulState({required this.message});
}
