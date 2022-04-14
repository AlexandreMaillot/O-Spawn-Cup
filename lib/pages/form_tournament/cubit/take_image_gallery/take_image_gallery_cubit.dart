import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'take_image_gallery_state.dart';

class TakeImageGalleryCubit extends Cubit<TakeImageGalleryState> {
  TakeImageGalleryCubit() : super(TakeImageGalleryInitial());

  takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? imagePath = await _picker.pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500,imageQuality: 20);
    if(imagePath != null) {
      emit(TakeImageGalleryFinish(File(imagePath.path)));
    } else {
      emit(TakeImageGalleryNoData());
    }

  }

  loadPicture(String? urlPath){

    emit(TakeImageGalleryFinish(File(urlPath!)));
  }

  clearPicture() => emit(TakeImageGalleryNoData());
  takeImageAnimation() async {
    emit(TakeImageAnimated());
    await Future.delayed(const Duration(milliseconds: 500), () {
    });
    emit(TakeImageGalleryInitial());
  }
}
