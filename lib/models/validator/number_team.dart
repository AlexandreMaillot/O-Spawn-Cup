import "package:formz/formz.dart";

enum NumberTeamValidationError { inferior , zero}

class NumberTeam extends FormzInput<int?, NumberTeamValidationError> {
  const NumberTeam.pure() : super.pure(null);
  const NumberTeam.dirty([int? value]) : super.dirty(value);

  @override
  NumberTeamValidationError? validator(int? value) {

    if(value == 0 || value == null){
      return NumberTeamValidationError.zero;
    } else if(value < 2) {
      return NumberTeamValidationError.inferior;
    }
    else {
      return null;
    }
  }
}