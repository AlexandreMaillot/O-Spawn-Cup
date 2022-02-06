part of 'selected_image_predef_cubit.dart';

abstract class SelectedImagePredefState extends Equatable {
  const SelectedImagePredefState();
}

class SelectedImagePredefInitial extends SelectedImagePredefState {
  int? indexSelected;

  SelectedImagePredefInitial({required this.indexSelected});
  @override
  List<int?> get props => [indexSelected];
}
