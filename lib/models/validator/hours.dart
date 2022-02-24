import "package:formz/formz.dart";

enum HoursValidationError { empty, errorFormat }

class Hours extends FormzInput<String, HoursValidationError> {
  const Hours.pure() : super.pure("");
  const Hours.dirty([String value = ""]) : super.dirty(value);

  @override
  HoursValidationError? validator(String? value) {

    if(value == "" || value == null){
      return HoursValidationError.empty;
    }else if(value.contains(".") || value.contains("/")){
      return HoursValidationError.errorFormat;
    } else if(!value.contains(":")) {
      return HoursValidationError.errorFormat;
    } else if(value.length < 5) {
      return HoursValidationError.errorFormat;
    } else if(value.length == 5 ) {
      if(value.substring(2,3) != ":") {
        return HoursValidationError.errorFormat;
      }
    } else {
      return null;
    }

  }
}