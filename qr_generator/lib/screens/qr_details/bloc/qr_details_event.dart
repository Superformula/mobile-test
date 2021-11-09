part of 'qr_details_bloc.dart';

abstract class QrDetailsEvent extends Equatable {
  const QrDetailsEvent();
  @override
  List<Object> get props => [];
}
//Initial event
class FetchSeed extends QrDetailsEvent {
  const FetchSeed();
  @override
  List<Object> get props => [];
}

//Getting new seed data
class RefreshSeed extends QrDetailsEvent {
  const RefreshSeed();
  @override
  List<Object> get props => [];
}

//Checking the current network status
class CheckConnectivity extends QrDetailsEvent {
  final ConnectivityResult result;
  const CheckConnectivity(this.result);
  @override
  List<Object> get props => [result];
}
