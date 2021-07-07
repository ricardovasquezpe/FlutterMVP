import 'dart:async';
import 'package:flutterapp/mvp/bloc/bloc_base.dart';
import 'package:flutterapp/mvp/bloc/event.dart';

class Bloc implements BlocBase{
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounterSink => _counterStateController.sink;
  Stream<int> get counterStream => _counterStateController.stream;

  final _counterEventController = StreamController<Event>();
  Sink<Event> get counterEventSink => _counterEventController.sink;

  Bloc() {
    _counterEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(Event event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounterSink.add(_counter);
  }

  @override
  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }

}