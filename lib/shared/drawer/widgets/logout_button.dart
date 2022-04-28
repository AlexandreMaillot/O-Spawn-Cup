import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/app/bloc/app_bloc.dart';
import 'package:o_spawn_cup/constant.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBloc = context.read<AppBloc>();
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      child: TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Icon(
                Icons.power_settings_new,
                color: colorBackgroundTheme,
              ),
            ),
            Text(
              'Déconnexion',
              style: TextStyle(
                color: colorBackgroundTheme,
              ),
            ),
          ],
        ),
        onPressed: () => logout(appBloc, context),
      ),
    );
  }

  void logout(
    AppBloc appBloc,
    BuildContext context,
  ) {
    Navigator.pop(context);
    appBloc.add(AppLogoutRequested());
  }
}
