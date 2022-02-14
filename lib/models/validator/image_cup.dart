import 'dart:io';

import "package:formz/formz.dart";

enum ImageCupValidationError {empty}

class ImageCup extends FormzInput<File?, ImageCupValidationError> {
  const ImageCup.pure() : super.pure(null);
  const ImageCup.dirty([File? value]) : super.dirty(value);

  @override
  ImageCupValidationError? validator(File? value) {
    if(value == null){
      return ImageCupValidationError.empty;
    }
    else {
      return null;
    }
  }
}