import 'package:flutter/material.dart';

Widget radianBackgrounShared (
  {
    Color? firstColor,
    Color? secondColor,
  }
) {

  List<double> _stops = [0.1, 0.9];

  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              stops: _stops,
              colors: [
                firstColor!,
                secondColor!,
              ]
            )
          ),
        )
      ],
    ),
  );
}