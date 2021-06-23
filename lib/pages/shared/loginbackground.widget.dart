import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:my_project/shared/colors.dart';

class LoginBackground extends StatelessWidget {
  const LoginBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final boxDecoration = BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
        colors: [
          Color(0xffEF233C),
          Color(0xff000C66),
        ]
      )
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: boxDecoration,
          ),
          _BoxBackground()
        ],
      ),
    );
  }
}

class _BoxBackground extends StatelessWidget {
  const _BoxBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 200,
      transform: Matrix4.rotationZ(.8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: LinearGradient(
          colors: [
            ApplicationColors.kPrimaryColor,
            Color.fromRGBO(58, 12, 163, 0.5),
          ]
        )
      ),
    );
  }
}