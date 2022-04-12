import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:o_spawn_cup/services/field_bloc_validators_errors_fr.dart';



void main() {
  late FieldBlocValidatorsFr fieldBlocValidatorsFr;
  setUpAll(() {
    fieldBlocValidatorsFr = FieldBlocValidatorsFr();
  },);
  group('FieldBlocValidator email', () {
    
    test('error if "" ', () {
      String? check = FieldBlocValidatorsFr.email('');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if null ', () {
      String? check = FieldBlocValidatorsFr.email(null);
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if not contain @ ', () {
      String? check = FieldBlocValidatorsFr.email('testtest.com');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error format ', () {
      String? check = FieldBlocValidatorsFr.email('154545^dzfzqé');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('error if not contain . ', () {
      String? check = FieldBlocValidatorsFr.email('test@testcom');
      expect(FieldBlocValidatorsErrorsFr.email, check);
    });
    test('email is good', () {
      String? check = FieldBlocValidatorsFr.email('test@test.com');
      expect(null, check);
    });
    test('email alex', () {
      String? check = FieldBlocValidatorsFr.email('alexandre.maillot97@gmail.com');
      expect(null, check);
    });


  });

  group('FieldBlocValidator requis', () {

    test("field '' ", () {
      String? check = FieldBlocValidatorsFr.required('');
      expect(FieldBlocValidatorsErrorsFr.required, check);
    },);

    test('field null', () {
      String? check = FieldBlocValidatorsFr.required(null);
      expect(FieldBlocValidatorsErrorsFr.required, check);
    },);
    test('field good', () {
      String? check = FieldBlocValidatorsFr.required('Test');
      expect(null, check);
    },);

  },);

  group('FieldBlocValidator confirmpass', () {

    test("field '' ", () {
      final password = TextFieldBloc();
      String? check = FieldBlocValidatorsFr.verifConfirmPassword('',password);
      expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
    },);

    test('field null', () {
      final password = TextFieldBloc();
      String? check = FieldBlocValidatorsFr.verifConfirmPassword(null,password);
      expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
    },);
    test('field password different de confirmpassword', () {
      final password = TextFieldBloc(initialValue: 'Test123');
      String? check = FieldBlocValidatorsFr.verifConfirmPassword('Test',password);
      expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
    },);
    test('field password different de confirmpassword avec casse', () {
      final password = TextFieldBloc(initialValue: 'TEST');
      String? check = FieldBlocValidatorsFr.verifConfirmPassword('test',password);
      expect(FieldBlocValidatorsErrorsFr.confirmPassword, check);
    },);
    test('field password est égale à confirmpassword', () {
      final password = TextFieldBloc(initialValue: 'TEsT');
      String? check = FieldBlocValidatorsFr.verifConfirmPassword('TEsT',password);
      expect(null, check);
    },);

  },);

  group('FieldBlocValidator date superieur à aujourdhui', () {

    test('Date is null ', () {
      String? check = FieldBlocValidatorsFr.dateSupNow(null);
      expect(FieldBlocValidatorsErrorsFr.dateSupNow, check);
    },);

    test('Date inferior', () {
      DateTime dateTime = DateTime(DateTime.now().year - 1,);
      String? check = FieldBlocValidatorsFr.dateSupNow(dateTime);
      expect(FieldBlocValidatorsErrorsFr.dateSupNow, check);
    },);

    test('Date superior now', () {
      DateTime dateTime = DateTime(DateTime.now().year + 1,);
      String? check = FieldBlocValidatorsFr.dateSupNow(dateTime);
      expect(null, check);
    },);

  },);
  group('FieldBlocValidator number egal 0', () {

    test('number egal 0 ', () {
      String? check = FieldBlocValidatorsFr.numberNot0('0');
      expect(FieldBlocValidatorsErrorsFr.not0, check);
    },);
    test('number pas egal a 0 ', () {
      String? check = FieldBlocValidatorsFr.numberNot0('1');
      expect(null, check);
    },);
  },);



  group('FieldBlocValidator la date doit etre superieur a une date de reference', () {
    test('field inferior ', () {
      DateTime dateTime = DateTime(DateTime.now().year - 1,);
      final date = InputFieldBloc<DateTime, Object>(
        initialValue: DateTime.now(),
        name: 'date aujourdhui',
      );
      String? check = FieldBlocValidatorsFr.verifDateSup(dateTime, date);
      expect(FieldBlocValidatorsErrorsFr.dateSup, check);
    },);

    test('date null', () {
      final date = InputFieldBloc<DateTime, Object>(
        initialValue: DateTime.now(),
        name: 'date aujourdhui',
      );
      String? check = FieldBlocValidatorsFr.verifDateSup(null, date);
      expect(FieldBlocValidatorsErrorsFr.dateSup, check);
    },);
    test('field good', () {
      DateTime dateTime = DateTime(DateTime.now().year + 1,);
      final date = InputFieldBloc<DateTime, Object>(
        initialValue: DateTime.now(),
        name: 'date aujourdhui',
      );
      String? check = FieldBlocValidatorsFr.verifDateSup(dateTime, date);
      expect(null, check);
    },);

  },);

  group('FieldBlocValidator 4 caracteres min', () {

    test("field '' ", () {
      String? check = FieldBlocValidatorsFr.min4Char('');
      expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
    },);

    test('field null', () {
      String? check = FieldBlocValidatorsFr.min4Char(null);
      expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
    },);
    test('field 1 caract', () {
      String? check = FieldBlocValidatorsFr.min4Char('a');
      expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
    },);
    test('field 2 caract', () {
      String? check = FieldBlocValidatorsFr.min4Char('ab');
      expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
    },);
    test('field 3 caract', () {
      String? check = FieldBlocValidatorsFr.min4Char('abc');
      expect(FieldBlocValidatorsErrorsFr.stringMin4Chars, check);
    },);
    test('field 4 caract', () {
      String? check = FieldBlocValidatorsFr.min4Char('abcd');
      expect(null, check);
    },);

  },);
  group('FieldBlocValidator 6 caracteres min password', () {

    test("field '' ", () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);

    test('field null', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars(null);
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 1 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('a');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 2 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('ab');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 3 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('abc');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 4 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('abcd');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 5 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('abcde');
      expect(FieldBlocValidatorsErrorsFr.passwordMin6Chars, check);
    },);
    test('field 6 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('abcdef');
      expect(null, check);
    },);

    test('field 7 caract', () {
      String? check = FieldBlocValidatorsFr.passwordMin6Chars('abcdefg');
      expect(null, check);
    },);

  },);
}