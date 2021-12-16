import 'dart:math';
import 'package:flutter/material.dart';

class ListView8 extends StatefulWidget {
  @override
  _ListView8State createState() => _ListView8State();
}

class _ListView8State extends State<ListView8> {
  PageController pageController = PageController(viewportFraction: 0.5);
  var currentPageValue = 0.0;
  int menuActive = 1;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 450,
          child: PageView.builder(
              controller: pageController,
              itemCount: 10,
              itemBuilder: (context, position) {
                if (position == currentPageValue) {
                  return Transform.scale(
                    scale: 1,
                    child: GamePage(position),
                  );
                } else if (position < currentPageValue) {
                  return Transform.scale(
                    scale: max(1 - (currentPageValue - position), 0.5),
                    child: GamePage(position),
                  );
                } else {
                  return Transform.scale(
                    scale: max(1 - (position - currentPageValue), 0.5),
                    child: GamePage(position),
                  );
                }
              }),
        ),
      ),
    );
  }
}

class GamePage extends StatelessWidget {
  final int index;

  GamePage(this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Image.asset(
              index.isEven ? "assets/images/google.png" : "assets/images/google.png",
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index.isEven
                                ? Colors.white.withOpacity(0.3)
                                : Colors.black.withOpacity(0.1)),
                        child: Text(
                          "1.2k",
                          style: TextStyle(
                              color:
                              index.isEven ? Colors.white : Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "List ${index + 1}",
                    style: TextStyle(
                        fontSize: 20,
                        color: index.isEven ? Colors.white : Colors.black),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}