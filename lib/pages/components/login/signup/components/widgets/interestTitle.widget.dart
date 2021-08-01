import 'package:flutter/material.dart';


Container interestTitle(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(16),
    width: MediaQuery.of(context).size.width,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Text(
            'Elige tus intereses 🎧🎶',
            maxLines: 3,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25,
              color: Colors.white60
            ),
          ),
        ),
      ],
    ),
  );
}