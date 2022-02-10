import "package:formz/formz.dart";

enum DayValidationError { empty , zero}

class Day extends FormzInput<String, DayValidationError> {
  const Day.pure() : super.pure("");
  const Day.dirty([String value = ""]) : super.dirty(value);

  @override
  DayValidationError? validator(String? value) {
    if(value?.isEmpty == true){
      return DayValidationError.empty;
    } else if(value == "0") {
      return DayValidationError.zero;
    }
    else {
      return null;
    }
  }
}