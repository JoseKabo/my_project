import 'package:flutter/material.dart';

Widget topSheetElement( Size size ){
  return Container(
    padding: const EdgeInsets.all(5.0),
    child: Container(
      height: 5,
      width: size.width * 0.20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white54
      ),
    ),
  );
}

Widget topTitleSheetElement({
  String title='title sheet',
  Size? size
}){
  return Container(
    width: size!.width * 0.90,
    alignment: Alignment.topLeft,
    padding: EdgeInsets.only(
      top: 20.0
    ),
    child: FittedBox(
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: Colors.white70
        ),
      ),
    )
  );
}