part of 'qr_details_bloc.dart';

enum QrDetailStatus { initial, loaded, failure, loading }

abstract class QrDetailsState extends Equatable {
  const QrDetailsState();

  @override
  List<Object> get props => [];
}

//Initial State
class QrDetailsInitial extends QrDetailsState {}

//Loading state
class QrDetailsLoading extends QrDetailsState {
  @override
  List<Object> get props => [];
}

//Error state
class QrDetailsError extends QrDetailsState {
  final String error;
  const QrDetailsError(this.error);
  @override
  List<Object> get props => [error];
  @override
  String toString() => 'QrDetailsError';
}

class QrDetailsLoaded extends QrDetailsState {
  final SeedModel seedData;
  final bool status;
  final bool offline;
  const QrDetailsLoaded(
      {required this.seedData, this.status = true, this.offline = false});

  QrDetailsLoaded copyWith({SeedModel? seedData, bool? status, bool? offline}) {
    return QrDetailsLoaded(
      seedData: seedData ?? this.seedData,
      status: status ?? this.status,
      offline: offline ?? this.offline,
    );
  }

  @override
  List<Object> get props => [seedData, status, offline];
  @override
  String toString() => 'QrDetailsLoaded ';
}
