import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'generate_code_state.dart';

class GenerateCodeCubit extends Cubit<GenerateCodeState> {
  GenerateCodeCubit() : super(GenerateCodeInitial());
  int? numRound = 0;
  List<TextEditingController> listCode = [];

  String generateCode(String beforeCode, int length) {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final _rnd = Random();

    return beforeCode +
        String.fromCharCodes(
          Iterable.generate(
            length,
            (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
          ),
        );
  }

  void numRoundChange(int? num) {
    if (numRound != num && num != null) {
      emit(GenerateCodeNumChanged());
      if (num > 0) {
        final beforeCode = DateTime.now().millisecond.toString() +
            DateTime.now().microsecond.toString();
        listCode.clear();
        for (var i = 0; i < num; i++) {
          listCode.add(TextEditingController());
          listCode[i].text = generateCode(beforeCode, 5);
        }
      }

      emit(GenerateCodeFinish());
    }
    numRound = num;
  }
}
