import "package:formz/formz.dart";

enum GamerTagValidationError { empty }

class GamerTag extends FormzInput<String, GamerTagValidationError> {
  const GamerTag.pure() : super.pure("");
  const GamerTag.dirty([String value = ""]) : super.dirty(value);

  @override
  GamerTagValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : GamerTagValidationError.empty;
  }
}