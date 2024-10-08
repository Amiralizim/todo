import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 3 + 30,
              decoration: const BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                  image: AssetImage('images/Cover.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3 + 30,
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        Expanded(
          child: Container(color: Colors.white),
        )
      ]
    );
  }
}
