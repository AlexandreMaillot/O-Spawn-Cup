import "package:formz/formz.dart";

enum PointPerRangValidationError { inferior , zero}

class PointPerRang extends FormzInput<int?, PointPerRangValidationError> {
  const PointPerRang.pure() : super.pure(null);
  const PointPerRang.dirty([int? value]) : super.dirty(value);

  @override
  PointPerRangValidationError? validator(int? value) {
    if(value == null || value == ""){
      return PointPerRangValidationError.zero;
    }
    else {
      return null;
    }
  }
}