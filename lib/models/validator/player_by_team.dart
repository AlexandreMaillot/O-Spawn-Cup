import "package:formz/formz.dart";

enum PlayerByTeamValidationError {zero}

class PlayerByTeam extends FormzInput<int?, PlayerByTeamValidationError> {
  const PlayerByTeam.pure() : super.pure(null);
  const PlayerByTeam.dirty([int? value]) : super.dirty(value);

  @override
  PlayerByTeamValidationError? validator(int? value) {
    if(value == null || value == "null"){
      return PlayerByTeamValidationError.zero;
    }
    else {
      return null;
    }
  }
}