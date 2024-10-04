import 'package:flutter/material.dart';

class BackgroundLayout extends StatelessWidget {
  const BackgroundLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 3,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            image: const DecorationImage(
              image: AssetImage('images/Cover.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Container(color: Colors.white),
        )
      ]
    );
  }
}
