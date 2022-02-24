import "package:formz/formz.dart";

enum MonthValidationError { empty , zero, superior,length}

class Month extends FormzInput<int?, MonthValidationError> {
  const Month.pure() : super.pure(null);
  const Month.dirty([int? value]) : super.dirty(value);

  @override
  MonthValidationError? validator(int? value) {
    if(value == null){
      return MonthValidationError.empty;
    } else if(value == 0) {
      return MonthValidationError.zero;
    } else if(value > 12) {
      return MonthValidationError.superior;
    }
    // else if(value < 10) {
    //   if(value.toString().length != 2) {
    //     return MonthValidationError.length;
    //   }
    // }
    else {
      return null;
    }
  }
}