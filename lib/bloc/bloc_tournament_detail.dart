import "dart:async";

import "package:o_spawn_cup/bloc/bloc.dart";

class BlocTournamentDetail extends Bloc {
  double currentValue = 1.0;

  final _streamControllerValue = StreamController<double>();


  Stream<double> get streamValue => _streamControllerValue.stream;
  Sink<double> get sinkValue => _streamControllerValue.sink;

  changeGameSelect(double value) {
    currentValue = value;
    sinkValue.add(currentValue);
  }

  BlocTournamentDetail(){
    sinkValue.add(currentValue);
  }

  @override
  dispose() {
    _streamControllerValue.close();
  }

}