import "package:formz/formz.dart";

enum PlayerByTeamValidationError { inferior , zero}

class PlayerByTeam extends FormzInput<int?, PlayerByTeamValidationError> {
  const PlayerByTeam.pure() : super.pure(null);
  const PlayerByTeam.dirty([int? value = null]) : super.dirty(value);

  @override
  PlayerByTeamValidationError? validator(int? value) {
    if(value == null || value == 0){
      return PlayerByTeamValidationError.zero;
    } else if(value <= 1) {
      return PlayerByTeamValidationError.inferior;
    }
    else {
      return null;
    }
  }
}