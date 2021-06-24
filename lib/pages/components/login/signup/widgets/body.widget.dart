import 'package:flutter/material.dart';
import 'package:my_project/pages/shared/simpleElements/topheadersheet.widget.dart';

Widget signUpBody( BuildContext context ){
  final size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      topSheetElement(size),
      topTitleSheetElement(title: 'Crear cuenta', size: size)
    ],
  );
}