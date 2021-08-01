import 'package:flutter/material.dart';
import 'package:my_project/controllers/update.controller.dart';
import 'package:my_project/shared/colors.dart';
import 'package:progress_state_button/progress_button.dart';

Widget updateButton(
  String title,
  UpdateFormController updateFormController,
  BuildContext context
)  {
  return Container(
    padding: EdgeInsets.only(
      top: 25,
      bottom: 15
    ),
    child: ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text(title,style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.loading: Text("Cargando",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.fail: Text("Error",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
        ButtonState.success: Text("Exito",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
      },
      stateColors: {
        ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
        ButtonState.loading: Colors.blue.shade300,
        ButtonState.fail: Colors.red.shade300,
        ButtonState.success: Colors.green.shade400,
      },
      onPressed: () {
        updateFormController.checkForm();
      },
      state: updateFormController.buttonState,
    )
  );
}