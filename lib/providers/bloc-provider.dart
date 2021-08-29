// Generic Interface for all BLoCs
import 'package:flutter/material.dart';

abstract class Bloc {
  void dispose();
}

// Generic BLoC provider
class BlocProvider<T extends Bloc> extends StatefulWidget {
  BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
  }): super(key: key);

  final T bloc;
  final Widget child;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T maybeOf<T extends Bloc>(BuildContext context){
    BlocProvider<T>? provider = context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    if(provider != null) {
      return provider.bloc;
    } else {
      throw StateError("No bloc of type $T in the current context");
    }
  }
}

class _BlocProviderState<T> extends State<BlocProvider<Bloc>>{
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