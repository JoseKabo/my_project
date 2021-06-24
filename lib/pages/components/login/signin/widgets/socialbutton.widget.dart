import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/shared/colors.dart';

Widget socialButtonConnect({ 
  String? social, IconData? socialIcon, Color socialColor = Colors.white
}){
  return Container(
    margin: EdgeInsets.all(10),
    height: 60.0,
    child: SizedBox.fromSize(
      size: Size(60, 60), // button width and height
      child: ClipOval(
        child: Material(
          color: Colors.white24,
          child: InkWell(
            splashColor: ApplicationColors.kPrimaryColor,
            onTap: () {
              switch (social) {
                case 'facebook':
                  print('facebook tabed');
                break;
                case 'google':
                  print('google tabed');
                break;
                default:
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  socialIcon,
                  color: socialColor,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}