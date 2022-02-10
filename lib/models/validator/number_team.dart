import "package:formz/formz.dart";

enum NumberTeamValidationError { empty , zero}

class NumberTeam extends FormzInput<String, NumberTeamValidationError> {
  const NumberTeam.pure() : super.pure("");
  const NumberTeam.dirty([String value = ""]) : super.dirty(value);

  @override
  NumberTeamValidationError? validator(String? value) {
    if(value?.isEmpty == true){
      return NumberTeamValidationError.empty;
    } else if(value == "0") {
      return NumberTeamValidationError.zero;
    }
    else {
      return null;
    }
  }
}