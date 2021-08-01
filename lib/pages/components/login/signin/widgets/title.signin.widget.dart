import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget titleSignIn( context ){
  final size = MediaQuery.of(context).size;
  return Column(
    children: [
      Container(
        child: FittedBox(
          child: Text(
            'INICIAR SESION',
            maxLines: 2,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 28,
              color: Colors.white70
            ),
          ),
        ),
      ),
      SizedBox(
        height: size.height/8 ,
      )
    ],
  );
}