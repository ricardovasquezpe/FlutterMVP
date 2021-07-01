import 'dart:async';
import 'package:flutterapp/mvp/bloc/bloc_v2/bloc.dart';
import 'package:flutterapp/mvp/bloc/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent>{
  int _counter = 0;

  final _counterStateController = StreamController<int>();
  StreamSink<int> get _inCounterSink => _counterStateController.sink;
  Stream<int> get counterStream => _counterStateController.stream;

  //final _counterEventController = StreamController<CounterEvent>();
  //Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    //_counterEventController.stream.listen(_mapEventToState);
    this.stateController.stream.listen(_mapEventToState);

  }

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementEvent) {
      _counter++;
    } else {
      _counter--;
    }

    _inCounterSink.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    //_counterEventController.close();
  }

}