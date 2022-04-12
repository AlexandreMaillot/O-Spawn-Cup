import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class FieldBlocValidatorsErrorsFr {
  FieldBlocValidatorsErrorsFr._();

  static const String required = 'Requis !';
  static const String not0 = 'Egal 0';

  static const String email = 'Email mauvais format';
  static const String dateSup  = 'Date antérieur à la date de référence';
  static const String dateSupNow  = 'Date antérieur à la date du jour';

  static const String passwordMin6Chars = 'Mot de passe 6 caractéres minimum';
  static const String stringMin4Chars = 'chaine 4 caractéres minimum';

  static const String confirmPassword = 'Confirm Password - Validator Error';
}

class FieldBlocValidatorsFr {
  FieldBlocValidatorsFr();
  static String? required(dynamic value) {
    if (value == null ||
        value == false ||
        ((value is Iterable || value is String || value is Map) &&
            value.length == 0)) {
      return FieldBlocValidatorsErrorsFr.required;
    }
    return null;
  }
  static String? email(String? string) {
    final emailRegExp =
    RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if(string != null) {
      if(string.isNotEmpty) {
        if (emailRegExp.hasMatch(string)) {
          return null;
        }
      }
    }
    return FieldBlocValidatorsErrorsFr.email;
  }

  static Validator<DateTime?> dateSupOtherDate(InputFieldBloc<DateTime, Object> dateTimeOther,) {
    return (DateTime? dateTime) {
      return verifDateSup(dateTime, dateTimeOther);
    };
  }

  static String? verifDateSup(DateTime? dateTime, InputFieldBloc<DateTime, Object> dateTimeOther) {
    if(dateTime != null && dateTime.isAfter(dateTimeOther.value)) {
      return null;
    }
    return FieldBlocValidatorsErrorsFr.dateSup;
  }

  static String? dateSupNow(DateTime? dateTime,) {
    if(dateTime != null  && (dateTime.isAfter(DateTime.now()) || dateTime.isAtSameMomentAs(DateTime.now()))) {
      return null;
    }
    return FieldBlocValidatorsErrorsFr.dateSupNow;
  }
  static String? passwordMin6Chars(String? string) {
    if (string != null) {
      if(string.isNotEmpty){
        if(string.runes.length >= 6){
          return null;
        }
      }
    }
    return FieldBlocValidatorsErrorsFr.passwordMin6Chars;
  }

  static String? min4Char(String? string) {
    if (string == null || string.runes.length < 4) {
      return FieldBlocValidatorsErrorsFr.stringMin4Chars;
    }
    return null;
  }

  static String? numberNot0(String? string) {
    if (string == '0') {
      return FieldBlocValidatorsErrorsFr.not0;
    }
    return null;
  }

  static Validator<String?> confirmPassword(
      TextFieldBloc passwordTextFieldBloc,
      ) {
    return (String? confirmPassword) {
      return verifConfirmPassword(confirmPassword, passwordTextFieldBloc);
    };
  }

  static String? verifConfirmPassword(String? confirmPassword, TextFieldBloc<dynamic> passwordTextFieldBloc) {
    if(confirmPassword != null) {
      if(confirmPassword.isNotEmpty){
        if(confirmPassword == passwordTextFieldBloc.value){
          return null;
        }
      }
    }
    return FieldBlocValidatorsErrorsFr.confirmPassword;
  }
}
