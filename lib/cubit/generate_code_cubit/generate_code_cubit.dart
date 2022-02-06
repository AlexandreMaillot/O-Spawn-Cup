import "dart:math";

import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";

part "generate_code_state.dart";

class GenerateCodeCubit extends Cubit<GenerateCodeState> {
  GenerateCodeCubit() : super(GenerateCodeInitial());

  
  String generateCode(String beforeCode,int length){
    const String _chars = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890";
    final Random _rnd = Random();
    String code = beforeCode + String.fromCharCodes(Iterable.generate(length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
    emit(GenerateCodeFinish(code: code));
    return code;
  }
}
