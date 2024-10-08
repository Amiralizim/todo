import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  const HeaderSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateTime.now().toString().split(' ')[0],
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  blurRadius: 10.0, 
                  color: Colors.black.withOpacity(0.5), 
                  offset: Offset(2.0, 2.0)
                )
              ]
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2.0, 0),
                ),
              ],
            ),
          )
        ]
      )
    );
  }
}
