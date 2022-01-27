import 'dart:async';

import 'package:o_spawn_cup/bloc/bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/card_game.dart';

class BlocListGame extends Bloc {
  double currentValue = 1.0;

  final _streamControllerValue = StreamController<double>();


  Stream<double> get streamValue => _streamControllerValue.stream;
  Sink<double> get sinkValue => _streamControllerValue.sink;

  changeGameSelect(double value) {
    currentValue = value;
    sinkValue.add(currentValue);
  }

  BlocListGame(){
    sinkValue.add(currentValue);
  }

  @override
  dispose() {
    _streamControllerValue.close();
  }

}