import "package:formz/formz.dart";

enum StartRangValidationError { inferior , zero}

class StartRang extends FormzInput<int?, StartRangValidationError> {
  const StartRang.pure() : super.pure(null);
  const StartRang.dirty([int? value]) : super.dirty(value);

  @override
  StartRangValidationError? validator(int? value) {
    if(value == null || value == ""){
      return StartRangValidationError.zero;
    }
    else {
      return null;
    }
  }
}