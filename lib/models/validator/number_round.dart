import "package:formz/formz.dart";

enum NumberRoundValidationError { empty , zero}

class NumberRound extends FormzInput<String, NumberRoundValidationError> {
  const NumberRound.pure() : super.pure("");
  const NumberRound.dirty([String value = ""]) : super.dirty(value);

  @override
  NumberRoundValidationError? validator(String? value) {
    print(value);
    if(value?.isEmpty == true){
      return NumberRoundValidationError.empty;
    } else if(value == "0") {
      return NumberRoundValidationError.zero;
    }
    else {
      return null;
    }
  }
}