import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:o_spawn_cup/pages/form_tournament/widgets/tile_image_pre.dart';

part 'selected_image_predef_state.dart';

class SelectedImagePredefCubit extends Cubit<SelectedImagePredefState> {
  List<TileImagePre> listImageFiltred = [];
  SelectedImagePredefCubit()
      : super(const SelectedImagePredefInitial(indexSelected: null));

  void changedIndexSelect({int? indexSelect}) {
    final indexState =
        indexSelect == (state as SelectedImagePredefInitial).indexSelected
            ? null
            : indexSelect;
    emit(SelectedImagePredefInitial(indexSelected: indexState));
  }

  void clearImgSelect() =>
      emit(const SelectedImagePredefInitial(indexSelected: null));

  Future<void> selectImagePreDefAnimation() async {
    emit(SelectedImagePredefAnimated());
    await Future.delayed(const Duration(milliseconds: 500));
    emit(const SelectedImagePredefInitial(indexSelected: null));
  }
}
