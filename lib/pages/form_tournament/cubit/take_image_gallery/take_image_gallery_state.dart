part of 'take_image_gallery_cubit.dart';

abstract class TakeImageGalleryState extends Equatable {
  File? imageTaked;
  TakeImageGalleryState({required this.imageTaked});
  @override
  List<File?> get props => [imageTaked];
}

class TakeImageGalleryInitial extends TakeImageGalleryState {
  TakeImageGalleryInitial() : super(imageTaked: null);

}
class TakeImageGalleryNoData extends TakeImageGalleryState {
  TakeImageGalleryNoData() : super(imageTaked: null);

}

class TakeImageAnimated extends TakeImageGalleryState {
  TakeImageAnimated() : super(imageTaked: null);
}
class TakeImageGalleryFinish extends TakeImageGalleryState {
  TakeImageGalleryFinish(File? file) : super(imageTaked: file);
}
