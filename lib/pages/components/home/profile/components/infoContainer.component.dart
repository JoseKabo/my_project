import 'package:flutter/material.dart';

Widget showInfoContainer({
  String? title, String? info
}) {
  return Container(  
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.black26,
      border: Border.all(
        color: Colors.blueAccent,
        width: 1
      )
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            color: Colors.white.withOpacity(0.5)
          ),
        ),
        SizedBox(height: 5,),
        Text(
          info!,
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w700
          ),
        )
      ],
    ),
  );
}