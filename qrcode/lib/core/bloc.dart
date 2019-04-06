// Generic Interface for all BLoCs
import 'package:flutter/material.dart';
import 'package:qrcode/env/env.dart';

///
/// Base Bloc and BlocProvider utilized from
/// https://www.didierboelens.com/2018/08/reactive-programming---streams---bloc/
///
abstract class BlocBase {
  Env _env;

  BlocBase(this._env);

  Manager getManager(String mgrKey) => _env.getManager(mgrKey);

  void dispose();
}

// Generic BLoC provider
class BlocProvider<T extends BlocBase> extends StatefulWidget {
  BlocProvider({
    Key key,
    @required this.child,
    @required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T of<T extends BlocBase>(BuildContext context){
    final type = _typeOf<BlocProvider<T>>();
    BlocProvider<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  static Type _typeOf<T>() => T;
}

class _BlocProviderState<T> extends State<BlocProvider<BlocBase>>{
  @override
  void dispose(){
    widget.bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return widget.child;
  }
}