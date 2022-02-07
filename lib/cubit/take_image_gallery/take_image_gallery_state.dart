part of 'take_image_gallery_cubit.dart';

abstract class TakeImageGalleryState extends Equatable {
  File? imageTaked;
  TakeImageGalleryState({required this.imageTaked});
  @override
  List<File?> get props => [];
}

class TakeImageGalleryInitial extends TakeImageGalleryState {
  TakeImageGalleryInitial() : super(imageTaked: null);

}
class TakeImageGalleryNoData extends TakeImageGalleryState {
  TakeImageGalleryNoData() : super(imageTaked: null);

}
class TakeImageGalleryFinish extends TakeImageGalleryState {
  TakeImageGalleryFinish(File? file) : super(imageTaked: file);
  @override
  List<File?> get props => [imageTaked];
}
