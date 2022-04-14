import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/pages/form_tournament/form_tournament.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep6(TournamentFormBloc tournamentFormBloc) {
  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 5
        ? StepState.complete
        : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 5,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextElement(
          text: 'Identifiants',
          color: colorTheme,
        )
      ],
    ),
    content: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocBuilder<ListFieldBloc<TextFieldBloc, dynamic>,
            ListFieldBlocState<TextFieldBloc, dynamic>>(
          bloc: tournamentFormBloc.listCode,
          builder: (context, state) {
            if (state.fieldBlocs.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.fieldBlocs.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    child: TextFieldForm(
                      textFieldBloc: state.fieldBlocs[index],
                      hintText: 'CODE ${index + 1}',
                      suffixIcon: const Icon(Icons.refresh),
                      onPressIconSuffix: () => tournamentFormBloc.changeCode(index),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        )
      ],
    ),
  );
}
