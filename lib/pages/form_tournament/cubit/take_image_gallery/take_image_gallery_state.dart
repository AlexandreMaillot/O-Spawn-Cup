part of 'take_image_gallery_cubit.dart';

abstract class TakeImageGalleryState extends Equatable {
  final File? imageTaked;
  const TakeImageGalleryState({required this.imageTaked});
  @override
  List<File?> get props => [imageTaked];
}

class TakeImageGalleryInitial extends TakeImageGalleryState {
  const TakeImageGalleryInitial() : super(imageTaked: null);
}

class TakeImageGalleryNoData extends TakeImageGalleryState {
  const TakeImageGalleryNoData() : super(imageTaked: null);
}

class TakeImageAnimated extends TakeImageGalleryState {
  const TakeImageAnimated() : super(imageTaked: null);
}

class TakeImageGalleryFinish extends TakeImageGalleryState {
  const TakeImageGalleryFinish(File? file) : super(imageTaked: file);
}
