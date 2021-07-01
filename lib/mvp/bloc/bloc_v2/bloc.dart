import 'dart:async';

abstract class Bloc <T> {
  final stateController = StreamController<T>.broadcast();

  Stream<T> get observableState => stateController.stream;

  void dispose(){
    stateController.close();
  }
}