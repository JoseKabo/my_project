import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/controllers/signin.controller.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:my_project/shared/colors.dart';

class SignInButton extends StatefulWidget {
  SignInButton({Key? key, required this.signInFormController}) : super(key: key);

  final SignInFormController signInFormController;
  @override
  _SignInButtonState createState() => _SignInButtonState(signInFormController);
}

class _SignInButtonState extends State<SignInButton> {
  
  var _signInFormController;
  _SignInButtonState(SignInFormController signInFormController){
    this._signInFormController = signInFormController;
  }

  ButtonState currentState = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        bottom: 15
      ),
      child: ProgressButton(
        stateWidgets: {
          ButtonState.idle: Text("INICIAR SESION",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.loading: Text("Loading",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.fail: Text("Información incorrecta",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.success: Text("Success",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
        },
        stateColors: {
          ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
          ButtonState.loading: Colors.blue.shade300,
          ButtonState.fail: Colors.red.shade300,
          ButtonState.success: Colors.green.shade400,
        },
        onPressed: () async {
          if(!_signInFormController.checkForm()){
            setState(() {
              this.currentState = ButtonState.fail;
            });
            return;
          }
          setState(() {
            this.currentState = ButtonState.loading;
          });
          bool booleanResponse = await _signInFormController.signInRequest();
          Future.delayed(Duration(milliseconds: 2000), () {
            setState(()  {
              this.currentState =  booleanResponse
                  ? ButtonState.success
                  : ButtonState.fail;
            });
            if(this.currentState == ButtonState.success)
              Navigator.pushReplacementNamed(context, 'Main');
          });
        },
        
        state: currentState,
      )
    );
  }
}
