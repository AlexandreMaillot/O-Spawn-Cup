import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/cubit/list_cash_prizes_cubit.dart';
import 'package:o_spawn_cup/pages/form_tournament/bloc/tournament_form_bloc.dart';
import 'package:o_spawn_cup/shared/widgets/text_element.dart';

FormBlocStep buildStep5(TournamentFormBloc tournamentFormBloc,) {

  return FormBlocStep(
    state: tournamentFormBloc.state.currentStep > 4 ? StepState.complete : StepState.disabled,
    isActive: tournamentFormBloc.state.currentStep >= 4,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextElement(
          text: 'Cash prizes',
          color: colorTheme,
        )
      ],
    ),
    content: BlocBuilder<ListCashPrizesCubit, ListCashPrizesState>(
      builder: (context, state) {
        return Column(
          children: [
            (context.read<ListCashPrizesCubit>().list.isEmpty)
                ? TextElement(text: "Il n'y a aucun cash prizes !",color: Colors.white,)
                : ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              primary: false,
              itemCount: context.read<ListCashPrizesCubit>().list.length,
              itemBuilder: (context, index) {


                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    TextElement(text: (index + 1).toString()+ ' ',color: Colors.white,),
                    const Expanded(
                      child: DottedLine(
                        dashColor: Colors.white,
                        lineThickness: 0.3,
                      ),
                    ),
                    InkWell(
                        onTap: () => _displayTextInputDialog(context,index),
                        child: TextElement(text: context.read<ListCashPrizesCubit>().list[index].toString() ,color: Colors.white)),
                    IconButton(onPressed: () => context.read<ListCashPrizesCubit>().deleteCashPrizes(index),icon: const Icon(Icons.delete_forever,color: Colors.red,)),
                  ],
                );

              },
            ),
            TextButton.icon(onPressed: () => _displayTextInputDialog(context,null), icon: const Icon(Icons.add_circle,color: Colors.white), label: TextElement(text: 'Ajouter un lot',color: colorTheme,))
          ],
        );
      },
    ),
  );
}
Future<void> _displayTextInputDialog(BuildContext contextLocal,int? index) async {
  TextEditingController _textFieldController = TextEditingController();
  return showDialog(
      context: contextLocal,
      builder: (context) {
        _textFieldController.text = (index != null) ? contextLocal.read<ListCashPrizesCubit>().list[index] : '';
        return AlertDialog(
          title: TextElement(text: 'Ajouter un cash prize'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Pull o-spawn,discord nitro,Skin fornite...'),
          ),
          actions: <Widget>[
            TextButton(
              child: TextElement(text: 'Annuler'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: TextElement(text: 'Valider',color: colorOrange,),
              onPressed: () {
                if(index != null){
                  contextLocal.read<ListCashPrizesCubit>().modifCashPrize(index,_textFieldController.text);
                } else {
                  contextLocal.read<ListCashPrizesCubit>().addCashPrize(_textFieldController.text);
                }

                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}