import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:qr_generator/data/storage.dart';
import 'package:qr_generator/model/seed_model.dart';
import 'package:qr_generator/repositories/seed_repository.dart';

part 'qr_details_event.dart';
part 'qr_details_state.dart';

class QrDetailsBloc extends Bloc<QrDetailsEvent, QrDetailsState> {
  final SeedRepository _seedRepository;
  final SuperformulaStorage _storage;

  QrDetailsBloc(SeedRepository seedRepository, SuperformulaStorage storage)
      : assert(seedRepository != null),
        _seedRepository = seedRepository,
        _storage = storage,
        super(QrDetailsLoading());

  @override
  Stream<QrDetailsState> mapEventToState(QrDetailsEvent event) async* {
    //Inital event
    if (event is FetchSeed) {
      yield QrDetailsLoading();
      try {
        yield await manageConnectivityData();
      } catch (e) {
        yield QrDetailsError(e.toString());
      }
    }
    //Events after the app its load in the first time
    var currentState = state;
    if (currentState is QrDetailsLoaded) {
      if (event is RefreshSeed && !currentState.offline) {
        try {
          yield currentState.copyWith(
              status: !currentState.status,
              seedData:
                  await manageData(false, oldSeed: currentState.seedData));
        } catch (e) {
          yield QrDetailsError(e.toString());
        }
      }
      //Checking connection and managing data accordingly
      if (event is CheckConnectivity) {
        try {
          if (currentState.offline && event.result != ConnectivityResult.none) {
            //Online state
            yield currentState.copyWith(
                seedData:
                    await manageData(false, oldSeed: currentState.seedData),
                status: !currentState.status,
                offline: false);
          } else if (!currentState.offline &&
              event.result == ConnectivityResult.none) {
            //Offline state
            yield currentState.copyWith(
                status: !currentState.status, offline: true);
          }
        } catch (e) {
          yield QrDetailsError(e.toString());
        }
      }
    }
  }

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
    if (offline) {
      //Offline state
      // Getting last seed stored
      SeedModel seedModel = (await _storage.seedList('')).last;
      return seedModel;
    } else {
      //Online state
      if (oldSeed != null) {
        // Removing data
        await _storage.removeSeed(oldSeed);
      }
      // Requesting new seed
      SeedModel seedModel = await _seedRepository.getSeedData();
      // Saving new seed
      await _storage.addToSeed(seedModel);
      return seedModel;
    }
  }

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
