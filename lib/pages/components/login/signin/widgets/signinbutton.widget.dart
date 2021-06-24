import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:my_project/shared/colors.dart';

Widget signInButton(){
  return Container(
    padding: EdgeInsets.only(
      top: 25,
      bottom: 15
    ),
    child: ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text("INICIAR SESION",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.loading: Text("Loading",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.fail: Text("Fail",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.success: Text("Success",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
      },
      stateColors: {
        ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
        ButtonState.loading: Colors.blue.shade300,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: () {},
      state: ButtonState.idle,
    )
  );
}