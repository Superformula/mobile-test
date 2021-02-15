import 'package:qr_code/redux/actions.dart';
import 'package:qr_code/redux/app_state.dart';
import 'package:redux/redux.dart';

final appReducer = combineReducers<AppState>([
  TypedReducer<AppState, FetchSeedAction>(_onFetchSeed),
  TypedReducer<AppState, SeedLoadedAction>(_onSeedLoaded),
]);

AppState _onFetchSeed(AppState state, FetchSeedAction action) => state.copyWith(isLoadingSeed: true);

AppState _onSeedLoaded(AppState state, SeedLoadedAction action) => state.copyWith(
      seed: action.seed,
      isLoadingSeed: false,
    );
