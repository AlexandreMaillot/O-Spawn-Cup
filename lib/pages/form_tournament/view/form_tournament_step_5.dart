// ignore_for_file: noop_primitive_operations

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep5(
  TournamentFormBloc tournamentFormBloc,
) {
  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 4
        ? StepState.complete
        : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 4,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        TextElement(
          text: 'Cash prizes',
          color: colorTheme,
        ),
      ],
    ),
    content: BlocBuilder(
      bloc: tournamentFormBloc.listCashPrize,
      builder: (context, state) {
        return Column(
          children: [
            if (tournamentFormBloc.listCashPrize.value.isEmpty)
              const TextElement(
                text: "Il n'y a aucun cash prizes !",
                color: Colors.white,
              )
            else
              ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                primary: false,
                itemCount: tournamentFormBloc.listCashPrize.value.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextElement(
                        text: '${index + 1} ',
                        color: Colors.white,
                      ),
                      const Expanded(
                        child: DottedLine(
                          dashColor: Colors.white,
                          lineThickness: 0.3,
                        ),
                      ),
                      InkWell(
                        onTap: () => _displayTextInputDialog(context, index),
                        child: TextElement(
                          text: tournamentFormBloc.listCashPrize.value[index]
                              .toString(),
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            tournamentFormBloc.deleteCashPrize(index),
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  );
                },
              ),
            TextButton.icon(
              onPressed: () => _displayTextInputDialog(context, null),
              icon: const Icon(Icons.add_circle, color: Colors.white),
              label: const TextElement(
                text: 'Ajouter un lot',
                color: colorTheme,
              ),
            ),
          ],
        );
      },
    ),
  );
}

Future<void> _displayTextInputDialog(
  BuildContext contextLocal,
  int? index,
) async {
  final _textFieldController = TextEditingController();
  final tournamentFormBloc = contextLocal.read<TournamentFormBloc>();

  return showDialog(
    context: contextLocal,
    builder: (context) {
      _textFieldController.text =
          (index != null) ? tournamentFormBloc.listCashPrize.value[index] : '';

      return AlertDialog(
        title: const TextElement(text: 'Ajouter un cash prize'),
        content: TextField(
          controller: _textFieldController,
          decoration: const InputDecoration(
            hintText: 'Pull o-spawn,discord nitro,Skin fornite...',
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const TextElement(text: 'Annuler'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const TextElement(
              text: 'Valider',
              color: colorOrange,
            ),
            onPressed: () {
              if (index != null) {
                tournamentFormBloc.modifCashPrize(
                  index,
                  _textFieldController.text,
                );
              } else {
                tournamentFormBloc.addCashPrize(_textFieldController.text);
              }

              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
