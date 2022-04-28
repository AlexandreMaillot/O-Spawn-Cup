import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:o_spawn_cup/constant.dart';
import 'package:o_spawn_cup/shared/drawer/drawer.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerCubit = context.read<DrawerCubit>();
    final screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Drawer(
        backgroundColor: colorTheme,
        child: Column(
          children: [
            Container(
              width: screenSize.width,
              color: colorBackgroundTheme,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: CircleAvatar(
                        radius: 56,
                      ),
                    ),
                    BlocBuilder<DrawerCubit, DrawerState>(
                      buildWhen: (previous, current) =>
                          current is DrawerMemberChanged,
                      builder: (context, state) {
                        if (state is DrawerMemberChanged) {
                          return SizedBox(
                            child: Text(
                              drawerCubit.member.pseudo,
                              key: const Key('Pseudo'),
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }

                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 11, right: 11, top: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: screenSize.height * 0.23,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          HomeButton(),
                          ProfilButton(),
                          CreateCupButton(),
                        ],
                      ),
                    ),
                    const LogoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
