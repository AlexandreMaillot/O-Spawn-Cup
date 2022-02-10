import "package:formz/formz.dart";

enum NameCupValidationError { empty }

class NameCup extends FormzInput<String, NameCupValidationError> {
  const NameCup.pure() : super.pure("");
  const NameCup.dirty([String value = ""]) : super.dirty(value);

  @override
  NameCupValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : NameCupValidationError.empty;
  }
}