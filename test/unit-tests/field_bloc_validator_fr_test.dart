import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';

void main() {
  group('FieldBlocValidator email', () {
    test('error if "" ', () {
      final check = FieldBlocValidatorsFr.email('');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if null ', () {
      final check = FieldBlocValidatorsFr.email(null);
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if not contain @ ', () {
      final check = FieldBlocValidatorsFr.email('testtest.com');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error format ', () {
      final check = FieldBlocValidatorsFr.email('154545^dzfzqé');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if not contain . ', () {
      final check = FieldBlocValidatorsFr.email('test@testcom');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('email is good', () {
      final check = FieldBlocValidatorsFr.email('test@test.com');
      expect(null, check);
    });
    test('email alex', () {
      final check =
          FieldBlocValidatorsFr.email('alexandre.maillot97@gmail.com');
      expect(null, check);
    });
  });

  group(
    'FieldBlocValidator requis',
    () {
      test(
        "field '' ",
        () {
          final check = FieldBlocValidatorsFr.required('');
          expect(FieldBlocValidatorsErrorsFr.required, check);
        },
      );

      test(
        'field null',
        () {
          final check = FieldBlocValidatorsFr.required(null);
          expect(FieldBlocValidatorsErrorsFr.required, check);
        },
      );
      test(
        'field good',
        () {
          final check = FieldBlocValidatorsFr.required('Test');
          expect(null, check);
        },
      );
    },
  );

  group(
    'FieldBlocValidator confirmpass',
    () {
      test(
        "field '' ",
        () {
          final password = TextFieldBloc<dynamic>();
          final check =
              FieldBlocValidatorsFr.verifConfirmPassword('', password);
          expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
        },
      );

      test(
        'field null',
        () {
          final password = TextFieldBloc<dynamic>();
          final check =
              FieldBlocValidatorsFr.verifConfirmPassword(null, password);
          expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
        },
      );
      test(
        'field password different de confirmpassword',
        () {
          final password = TextFieldBloc<dynamic>(initialValue: 'Test123');
          final check =
              FieldBlocValidatorsFr.verifConfirmPassword('Test', password);
          expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
        },
      );
      test(
        'field password different de confirmpassword avec casse',
        () {
          final password = TextFieldBloc<dynamic>(initialValue: 'TEST');
          final check =
              FieldBlocValidatorsFr.verifConfirmPassword('test', password);
          expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
        },
      );
      test(
        'field password est égale à confirmpassword',
        () {
          final password = TextFieldBloc(initialValue: 'TEsT');
          final check =
              FieldBlocValidatorsFr.verifConfirmPassword('TEsT', password);
          expect(null, check);
        },
      );
    },
  );

  group(
    'FieldBlocValidator date superieur à aujourdhui',
    () {
      test(
        'Date is null ',
        () {
          final check = FieldBlocValidatorsFr.dateSupNow(null);
          expect(FieldBlocValidatorsErrorsFr.dateSupNow, check);
        },
      );

      test(
        'Date inferior',
        () {
          final dateTime = DateTime(
            DateTime.now().year - 1,
          );
          final check = FieldBlocValidatorsFr.dateSupNow(dateTime);
          expect(FieldBlocValidatorsErrorsFr.dateSupNow, check);
        },
      );

      test(
        'Date superior now',
        () {
          final dateTime = DateTime(
            DateTime.now().year + 1,
          );
          final check = FieldBlocValidatorsFr.dateSupNow(dateTime);
          expect(null, check);
        },
      );
    },
  );
  group(
    'FieldBlocValidator number egal 0',
    () {
      test(
        'number egal 0 ',
        () {
          final check = FieldBlocValidatorsFr.numberNot0('0');
          expect(FieldBlocValidatorsErrorsFr.not0, check);
        },
      );
      test(
        'number pas egal a 0 ',
        () {
          final check = FieldBlocValidatorsFr.numberNot0('1');
          expect(null, check);
        },
      );
    },
  );

  group(
    'FieldBlocValidator la date doit etre superieur a une date de reference',
    () {
      test(
        'field inferior ',
        () {
          final dateTime = DateTime(
            DateTime.now().year - 1,
          );
          final date = InputFieldBloc<DateTime, Object>(
            initialValue: DateTime.now(),
            name: 'date aujourdhui',
          );
          final check = FieldBlocValidatorsFr.verifDateSup(dateTime, date);
          expect(FieldBlocValidatorsErrorsFr.dateSup, check);
        },
      );

      test(
        'date null',
        () {
          final date = InputFieldBloc<DateTime, Object>(
            initialValue: DateTime.now(),
            name: 'date aujourdhui',
          );
          final check = FieldBlocValidatorsFr.verifDateSup(null, date);
          expect(FieldBlocValidatorsErrorsFr.dateSup, check);
        },
      );
      test(
        'field good',
        () {
          final dateTime = DateTime(
            DateTime.now().year + 1,
          );
          final date = InputFieldBloc<DateTime, Object>(
            initialValue: DateTime.now(),
            name: 'date aujourdhui',
          );
          final check = FieldBlocValidatorsFr.verifDateSup(dateTime, date);
          expect(null, check);
        },
      );
    },
  );

  group(
    'FieldBlocValidator 4 caracteres min',
    () {
      test(
        "field '' ",
        () {
          final check = FieldBlocValidatorsFr.min4Char('');
          expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
        },
      );

      test(
        'field null',
        () {
          final check = FieldBlocValidatorsFr.min4Char(null);
          expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
        },
      );
      test(
        'field 1 caract',
        () {
          final check = FieldBlocValidatorsFr.min4Char('a');
          expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
        },
      );
      test(
        'field 2 caract',
        () {
          final check = FieldBlocValidatorsFr.min4Char('ab');
          expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
        },
      );
      test(
        'field 3 caract',
        () {
          final check = FieldBlocValidatorsFr.min4Char('abc');
          expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
        },
      );
      test(
        'field 4 caract',
        () {
          final check = FieldBlocValidatorsFr.min4Char('abcd');
          expect(null, check);
        },
      );
    },
  );
  group(
    'FieldBlocValidator 6 caracteres min password',
    () {
      test(
        "field '' ",
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );

      test(
        'field null',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars(null);
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 1 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('a');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 2 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('ab');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 3 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('abc');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 4 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('abcd');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 5 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('abcde');
          expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
        },
      );
      test(
        'field 6 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('abcdef');
          expect(null, check);
        },
      );

      test(
        'field 7 caract',
        () {
          final check = FieldBlocValidatorsFr.passwordMin6Chars('abcdefg');
          expect(null, check);
        },
      );
    },
  );
}
