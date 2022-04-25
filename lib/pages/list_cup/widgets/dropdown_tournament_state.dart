import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/models/tournament/tournament_state.dart';

class DropdownTournamentState extends StatelessWidget {
  const DropdownTournamentState({
    Key? key,
    required this.selectFieldBloc,
  }) : super(key: key);

  final SelectFieldBloc<TournamentState, dynamic> selectFieldBloc;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.87,
      height: screenSize.height * 0.05,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(31)),
      ),
      child: DropdownFieldBlocBuilder<TournamentState>(
        selectFieldBloc: selectFieldBloc,
        emptyItemLabel: 'Aucun',
        showEmptyItem: true,
        isExpanded: true,
        decoration: InputDecoration(
          isCollapsed: true,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          // filled: false,
          hintText: 'TYPE DE TOURNOIS',
          hintStyle: TextStyle(
            color: const Color(0xff707070).withOpacity(0.43),
            fontFamily: 'o_spawn_cup_font',
            fontSize: 14,
          ),
          suffixIcon: Container(
            transform: Matrix4.translationValues(0, -8, 0),
            alignment: AlignmentDirectional.center,
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 35,
            ),
          ),
        ),
        itemBuilder: (context, value) => FieldItem(child: Text(value.name)),
      ),
    );
  }
}
