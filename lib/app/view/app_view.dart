import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/app/routes/routes.dart';
import 'package:o_spawn_cup/theme.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: FlowBuilder<AppState>(
        state: context.select((AppBloc bloc) => bloc.state),
        onGeneratePages: (app, pages) => onGenerateAppViewPages(app: app),
      ),
    );
  }
}
