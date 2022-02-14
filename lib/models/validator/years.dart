import "package:formz/formz.dart";

enum YearsValidationError { empty , zero, superior, inferior}

class Years extends FormzInput<int?, YearsValidationError> {
  const Years.pure() : super.pure(null);
  const Years.dirty([int? value]) : super.dirty(value);

  @override
  YearsValidationError? validator(int? value) {
    if(value == null){
      return YearsValidationError.empty;
    } else if(value == 0) {
      return YearsValidationError.zero;
    } else if(value < DateTime.now().year) {
      // print("rf548f");
      return YearsValidationError.inferior;
    }
    else {

      return null;
    }
  }
}