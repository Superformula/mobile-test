import 'package:dependencies/dependencies.dart';

///
/// Global dependency injector.
/// Usage:
/// Foo f = inject();
/// or
/// var f = inject<Foo>();
///

Inject inject = Inject();

class Inject {
  static final Inject _instance = Inject._internal();

  Inject._internal();

  factory Inject() {
    return _instance;
  }

  factory Inject.init(List<Module> modules) {
    var inject = Inject();
    inject._init(modules);
    return inject;
  }

  Injector _injector;

  _init(List<Module> modules) {
    final builder = Injector.builder();

    // Install the modules.
    for (Module module in modules) {
      builder.install(module);
    }

    // Create the injector.
    _injector = builder.build();
  }

  T call<T>({String name, Params params}) {
    return _injector.get<T>(name: name, params: params);
  }
}
