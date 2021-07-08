import 'package:flutter/material.dart';

InkWell buttonProfileShared({
    Color? kiBackgrounColor,
    Color? kiForegroundColor,
    IconData? kiIcon,
    String? text,
    String? action
  }) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kiBackgrounColor!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              kiIcon!,
              color: kiForegroundColor,
              size: 18,
            ),
            SizedBox(width: 5,),
            Text(
              text!,
              style: TextStyle(
                color: kiForegroundColor,
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        print('edit');
      },
    );
  }