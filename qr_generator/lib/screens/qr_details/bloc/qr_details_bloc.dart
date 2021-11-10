import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_generator/data/storage.dart';
import 'package:qr_generator/model/seed_model.dart';
import 'package:qr_generator/repositories/seed_repository.dart';
import 'package:collection/collection.dart';
part 'qr_details_event.dart';
part 'qr_details_state.dart';

class QrDetailsBloc extends Bloc<QrDetailsEvent, QrDetailsState> {
  final SeedRepository seedRepository;
  final SuperformulaStorage storage;

  QrDetailsBloc({required this.seedRepository, required this.storage})
      : super(QrDetailsLoading()) {
    on<FetchSeed>(
      _onFetchSeed,
    );
    on<RefreshSeed>(
      _onRefreshSeed,
    );
    on<CheckConnectivity>(
      _onCheckConnectivity,
    );
  }

  ///Inital event
  Future<void> _onFetchSeed(
    FetchSeed event,
    Emitter<QrDetailsState> emit,
  ) async {
    emit(QrDetailsLoading());
    try {
      emit(await manageConnectivityData());
    } catch (e) {
      emit(QrDetailsError(e.toString()));
    }
  }

  ///Refresh current state
  Future<void> _onRefreshSeed(
    RefreshSeed event,
    Emitter<QrDetailsState> emit,
  ) async {
    final currentState = state;
    if (currentState is QrDetailsLoaded && !currentState.offline) {
      try {
        emit(currentState.copyWith(
            status: !currentState.status,
            seedData: await manageData(false, oldSeed: currentState.seedData)));
      } catch (e) {
        emit(QrDetailsError(e.toString()));
      }
    }
  }

  Future<void> _onCheckConnectivity(
    CheckConnectivity event,
    Emitter<QrDetailsState> emit,
  ) async {
    final currentState = state;
    if (currentState is QrDetailsLoaded) {
      try {
        if (currentState.offline && event.result != ConnectivityResult.none) {
          //Online state
          emit(currentState.copyWith(
              seedData: await manageData(false, oldSeed: currentState.seedData),
              status: !currentState.status,
              offline: false));
        } else if (!currentState.offline &&
            event.result == ConnectivityResult.none) {
          //Offline state
          emit(currentState.copyWith(
              status: !currentState.status, offline: true));
        }
      } catch (e) {
        emit(QrDetailsError(e.toString()));
      }
    }
  }

  ///Manage data based on the network status
  Future<QrDetailsLoaded> manageConnectivityData() async {
    if (await checkConnectivity()) {
      //Loading data using local storage
      return QrDetailsLoaded(
        seedData: await manageData(false),
        status: true,
        offline: false,
      );
    } else {
      //Loading data using network call
      return QrDetailsLoaded(
          seedData: await manageData(true), status: true, offline: true);
    }
  }

  Future<SeedModel> manageData(bool offline, {SeedModel? oldSeed}) async {
    //Offline state
    if (offline) {
      // Getting last seed stored
      List<SeedModel> seedModelList = await storage.seedList('');
      return seedModelList.isEmpty ? SeedModel.emptyData() : seedModelList.last;
    } else {
      //Online state
      if (oldSeed != null) {
        // Removing data
        await storage.removeSeed(oldSeed);
      }
      // Requesting new seed
      SeedModel seedModel = await seedRepository.getSeedData();
      // Saving new seed
      await storage.addToSeed(seedModel);
      return seedModel;
    }
  }

  ///Return if the device its offline
  Future<bool> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
