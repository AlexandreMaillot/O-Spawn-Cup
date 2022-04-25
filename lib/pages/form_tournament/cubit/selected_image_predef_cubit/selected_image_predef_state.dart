part of 'selected_image_predef_cubit.dart';

abstract class SelectedImagePredefState extends Equatable {
  const SelectedImagePredefState();
}

class SelectedImagePredefInitial extends SelectedImagePredefState {
  final int? indexSelected;

  const SelectedImagePredefInitial({required this.indexSelected});
  @override
  List<int?> get props => [indexSelected];
}

class SelectedImagePredefAnimated extends SelectedImagePredefState {
  @override
  List<int?> get props => [];
}
