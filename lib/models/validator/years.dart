import "package:formz/formz.dart";

enum YearsValidationError { empty , zero}

class Years extends FormzInput<String, YearsValidationError> {
  const Years.pure() : super.pure("");
  const Years.dirty([String value = ""]) : super.dirty(value);

  @override
  YearsValidationError? validator(String? value) {
    if(value?.isEmpty == true){
      return YearsValidationError.empty;
    } else if(value == "0") {
      return YearsValidationError.zero;
    }
    else {
      return null;
    }
  }
}