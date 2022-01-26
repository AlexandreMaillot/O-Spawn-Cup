import 'dart:async';

import 'package:o_spawn_cup/bloc/bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/models/card_game.dart';

class BlocListGame extends Bloc {
  double currentValue = 1.0;
  final _streamController = StreamController<List<CardGame>>();
  final _streamControllerValue = StreamController<double>();

  Stream<List<CardGame>> get stream => _streamController.stream;
  Sink<List<CardGame>> get sink => _streamController.sink;

  Stream<double> get streamValue => _streamControllerValue.stream;
  Sink<double> get sinkValue => _streamControllerValue.sink;

  BlocListGame(){
    sink.add(listCardGame);
    sinkValue.add(currentValue);
  }

  @override
  dispose() {
    return _streamController.close();
  }

}