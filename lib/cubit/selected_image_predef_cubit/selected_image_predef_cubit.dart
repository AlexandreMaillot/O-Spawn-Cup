import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import 'package:o_spawn_cup/ui/CustomsWidgets/tile_image_pre.dart';

part "selected_image_predef_state.dart";

class SelectedImagePredefCubit extends Cubit<SelectedImagePredefState> {
  List<TileImagePre> listImageFiltred = [];
  SelectedImagePredefCubit() : super(SelectedImagePredefInitial(indexSelected: null));

  changedIndexSelect(int? indexSelect){
    if(indexSelect == (state as SelectedImagePredefInitial).indexSelected) {
      indexSelect = null;
    }
    emit(SelectedImagePredefInitial(indexSelected: indexSelect));
  }
  clearImgSelect() => emit(SelectedImagePredefInitial(indexSelected: null));


  selectImagePreDefAnimation() async {
    emit(SelectedImagePredefAnimated());
    await Future.delayed(const Duration(milliseconds: 500), () {
    });
    emit(SelectedImagePredefInitial(indexSelected: null));
  }
}
