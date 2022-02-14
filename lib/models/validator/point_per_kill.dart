import "package:formz/formz.dart";

enum PointPerKillValidationError { inferior , zero}

class PointPerKill extends FormzInput<int?, PointPerKillValidationError> {
  const PointPerKill.pure() : super.pure(null);
  const PointPerKill.dirty([int? value]) : super.dirty(value);

  @override
  PointPerKillValidationError? validator(int? value) {
    if(value == null || value == ""){
      return PointPerKillValidationError.zero;
    }
    else {
      return null;
    }
  }
}