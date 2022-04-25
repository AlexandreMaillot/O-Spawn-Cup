import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'take_image_gallery_state.dart';

class TakeImageGalleryCubit extends Cubit<TakeImageGalleryState> {
  TakeImageGalleryCubit() : super(const TakeImageGalleryInitial());

  Future<void> takePicture() async {
    final _picker = ImagePicker();
    final imagePath = await _picker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 500,
      maxWidth: 500,
      imageQuality: 20,
    );
    if (imagePath != null) {
      emit(TakeImageGalleryFinish(File(imagePath.path)));
    } else {
      emit(const TakeImageGalleryNoData());
    }
  }

  void loadPicture(String? urlPath) {
    emit(TakeImageGalleryFinish(File(urlPath!)));
  }

  void clearPicture() => emit(const TakeImageGalleryNoData());
  Future<void> takeImageAnimation() async {
    emit(const TakeImageAnimated());
    await Future<dynamic>.delayed(
      const Duration(milliseconds: 500),
    );
    emit(const TakeImageGalleryInitial());
  }
}
