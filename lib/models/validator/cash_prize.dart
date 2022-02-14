import "package:formz/formz.dart";

enum CashPrizeValidationError { empty }

class CashPrize extends FormzInput<String, CashPrizeValidationError> {
  const CashPrize.pure() : super.pure("");
  const CashPrize.dirty([String value = ""]) : super.dirty(value);

  @override
  CashPrizeValidationError? validator(String? value) {
    return value?.isNotEmpty == true ? null : CashPrizeValidationError.empty;
  }
}