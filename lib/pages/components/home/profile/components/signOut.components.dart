import 'package:flutter/material.dart';
import 'package:my_project/shared/colors.dart';

Container signOutButton() {
  return Container(
    alignment: Alignment.topRight,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(26)
    ),
    child: Material(
      child: InkWell(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Cerrar sesion',
                style: TextStyle(
                  color: ApplicationColors.kDangerColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          print('close');
        },
        splashColor: ApplicationColors.kDangerColor,
      ),
    ),
  );
}