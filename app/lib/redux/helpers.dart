import 'dart:async';

import 'package:redux/redux.dart';

/// A helper class that allows consumers to specify what type of actions
/// a piece of middleware handles using generic types
abstract class TypedMiddlewareClass<State, Action>
    implements MiddlewareClass<State> {
  @override
  void call(
    Store<State> store,
    dynamic action,
    NextDispatcher next,
  ) async {
    if (action is Action) {
      handler(store, action, next);
    } else {
      next(action);
    }
  }

  FutureOr<void> handler(
    Store<State> store,
    Action action,
    NextDispatcher next,
  );
}
