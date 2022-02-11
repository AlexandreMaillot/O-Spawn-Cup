import "package:formz/formz.dart";

enum DayValidationError { empty , zero, superior}

class Day extends FormzInput<int?, DayValidationError> {
  const Day.pure() : super.pure(null);
  const Day.dirty([int? value = null]) : super.dirty(value);

  @override
  DayValidationError? validator(int? value) {
    if(value == null){
      return DayValidationError.empty;
    } else if(value == 0) {
      return DayValidationError.zero;
    } else if(value > 31) {
      return DayValidationError.superior;
    }
    else {
      return null;
    }
  }
}