import "package:formz/formz.dart";

enum MonthValidationError { empty , zero}

class Month extends FormzInput<String, MonthValidationError> {
  const Month.pure() : super.pure("");
  const Month.dirty([String value = ""]) : super.dirty(value);

  @override
  MonthValidationError? validator(String? value) {
    if(value?.isEmpty == true){
      return MonthValidationError.empty;
    } else if(value == "0") {
      return MonthValidationError.zero;
    }
    else {
      return null;
    }
  }
}