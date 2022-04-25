import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/models/server_type.dart';

class DropdownServer extends StatelessWidget {
  const DropdownServer({
    Key? key,
    required this.selectFieldBloc,
  }) : super(key: key);

  final SelectFieldBloc<ServerType, dynamic> selectFieldBloc;

  @override
  Widget build(BuildContext context) {
    return DropdownFieldBlocBuilder<ServerType>(
      selectFieldBloc: selectFieldBloc,
      textAlign: TextAlign.center,
      emptyItemLabel: 'Aucun',
      showEmptyItem: true,
      // isExpanded: true,
      decoration: InputDecoration(
        isCollapsed: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        filled: true,
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        // filled: false,

        hintText: 'SERVEUR',
        hintStyle: TextStyle(
          color: const Color(0xff707070).withOpacity(0.43),
          fontFamily: 'o_spawn_cup_font',
          fontSize: 14,
        ),
        suffixIcon: const Icon(
          Icons.keyboard_arrow_down,
        ),
      ),
      itemBuilder: (context, value) => FieldItem(child: Text(value.name)),
    );
  }
}
