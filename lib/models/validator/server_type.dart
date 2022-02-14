import "package:formz/formz.dart";

enum ServerTypeValidationError { empty }

class ServerType extends FormzInput<String?, ServerTypeValidationError> {
  const ServerType.pure() : super.pure(null);
  const ServerType.dirty([String? value]) : super.dirty(value);

  @override
  ServerTypeValidationError? validator(String? value) {
    if(value != "null" && value != null && value != ""){
      return null;
    } else {
      return ServerTypeValidationError.empty;
    }
  }
}