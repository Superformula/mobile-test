import 'dart:async';

import 'package:qr_generator/providers/bloc-provider.dart';

class IndexBloc implements Bloc {

  StreamController<bool> fabExpansionController = StreamController();

  // inputs 
  Function(bool) get setFabExpansion => fabExpansionController.sink.add;

  // output
  Stream<bool> get fabExpansionStream => fabExpansionController.stream;
  
  void dispose() {
    fabExpansionController.close();
  }
}