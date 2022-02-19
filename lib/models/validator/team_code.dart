import "package:formz/formz.dart";

enum TeamCodeValidationError { empty }

class TeamCode extends FormzInput<String, TeamCodeValidationError> {
  const TeamCode.pure() : super.pure("");
  const TeamCode.dirty([String value = ""]) : super.dirty(value);

  @override
  TeamCodeValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : TeamCodeValidationError.empty;
  }
}