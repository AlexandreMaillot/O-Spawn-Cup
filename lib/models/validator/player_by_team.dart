import "package:formz/formz.dart";

enum PlayerByTeamValidationError { empty , zero}

class PlayerByTeam extends FormzInput<String, PlayerByTeamValidationError> {
  const PlayerByTeam.pure() : super.pure("");
  const PlayerByTeam.dirty([String value = ""]) : super.dirty(value);

  @override
  PlayerByTeamValidationError? validator(String? value) {
    if(value?.isEmpty == true){
      return PlayerByTeamValidationError.empty;
    } else if(value == "0") {
      return PlayerByTeamValidationError.zero;
    }
    else {
      return null;
    }
  }
}