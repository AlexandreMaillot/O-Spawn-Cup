import "package:formz/formz.dart";

enum NumberRoundValidationError { inferior , zero}

class NumberRound extends FormzInput<int?, NumberRoundValidationError> {
  const NumberRound.pure() : super.pure(null);
  const NumberRound.dirty([int? value]) : super.dirty(value);

  @override
  NumberRoundValidationError? validator(int? value) {
    if(value == 0 || value == null){
      return NumberRoundValidationError.zero;
    }
    else {
      return null;
    }
  }
}