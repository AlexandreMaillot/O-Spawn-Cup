import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/models/Tournament/tournament_state.dart';
import 'package:o_spawn_cup/models/TournamentType/tournament_type.dart';
import 'package:o_spawn_cup/pages/list_cup/bloc/list_cup_filter_form_bloc.dart';

class DropdownTournamentType extends StatelessWidget {
  const DropdownTournamentType({
    Key? key,
    required this.selectFieldBloc,
  }) : super(key: key);

  final SelectFieldBloc<TournamentType, dynamic> selectFieldBloc;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,

      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(31),
      ),
      child: DropdownFieldBlocBuilder<TournamentType>(
        selectFieldBloc: selectFieldBloc,
        emptyItemLabel: "Aucun",
        showEmptyItem: true,
        isExpanded: true,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          // filled: false,
          hintText: 'ETAT',
          hintStyle: TextStyle(
            color: const Color(0xff707070).withOpacity(0.43),
            fontFamily: "o_spawn_cup_font",
            fontSize: 14,
          ),
          suffixIcon: Container(
            transform: Matrix4.translationValues(0.0, -8  , 0.0),
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.only(bottom: 0),
            child: const Icon(Icons.keyboard_arrow_down,size: 35,),
          ),
        ),
        itemBuilder: (context, value) => FieldItem(child: Text(value.name)),
      ),
    );
  }
}