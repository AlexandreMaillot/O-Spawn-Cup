import 'package:flutter/widgets.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/home/view/home.dart';
import 'package:o_spawn_cup/login/login.dart';
import 'package:o_spawn_cup/login/view/login_form.dart';
import 'package:o_spawn_cup/login/view/login_register.dart';

List<Page> onGenerateAppViewPages(AppStatus state, List<Page<dynamic>> pages) {
  switch (state) {
    case AppStatus.authenticated:
      return [Home.page()];
    case AppStatus.unauthenticated:
      return [LoginRegister.page()];
  }
}
