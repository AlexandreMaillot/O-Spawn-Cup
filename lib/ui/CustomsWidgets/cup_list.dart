import 'package:flutter/material.dart';

class CupList extends StatelessWidget {
  const CupList({
    Key? key,
    required this.screenSize,
    required this.pageController,
    required this.currentPageValue,
  }) : super(key: key);

  final Size screenSize;
  final PageController pageController;
  final double currentPageValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          child: Center(
            child: SizedBox(
              height: screenSize.height,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  itemCount: listCardGame.length,
                  itemBuilder: (context, position) {
                    if (position == currentPageValue) {
                      return Transform.scale(
                        scale: 1,
                        child: GameCard(position),
                      );
                    } else if (position < currentPageValue) {
                      return Transform.scale(
                        scale: max(1 - (currentPageValue - position), 0.75),
                        child: GameCard(position),
                      );
                    } else {
                      return Transform.scale(
                        scale: max(1 - (position - currentPageValue), 0.75),
                        child: GameCard(position),
                      );
                    }
                  }),
            ),
          ),
          color: colorBackgroundTheme,
        ));
  }
}