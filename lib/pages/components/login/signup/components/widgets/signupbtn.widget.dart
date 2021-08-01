import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/signin.controller.dart';
import 'package:my_project/controllers/signup.controller.dart';
import 'package:my_project/shared/colors.dart';
import 'package:progress_state_button/progress_button.dart';

class SignUpButton extends StatefulWidget {
  SignUpButton({Key? key}) : super(key: key);
  @override
  _SignUpButtonState createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  SignUpController signUpController = Get.find<SignUpController>();
  SignInFormController _signInFormController = Get.find<SignInFormController>();
  ButtonState currentState = ButtonState.idle;
  late BuildContext pcontext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        bottom: 15
      ),
      child: ProgressButton(
        stateWidgets: {
          ButtonState.idle: Text("REGISTRARSE AHORA",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.loading: Text("Por favor espere",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.fail: Text("Algo salio mal",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
          ButtonState.success: Text("Excelente :D",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
        },
        stateColors: {
          ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
          ButtonState.loading: Colors.blue.shade300,
          ButtonState.fail: Colors.red.shade300,
          ButtonState.success: Colors.green.shade400,
        },
        onPressed: () async {
          if(!signUpController.checkForm() || signUpController.awaitResponse.value ){
            setState(() {
              this.currentState = ButtonState.fail;
              if(signUpController.awaitResponse.value){
                  Fluttertoast.showToast(
                    msg: "Petición en curso...",
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 5
                );
              }
            });
            return;
          }
          setState(() {
            this.currentState = ButtonState.loading;
          });
          bool booleanResponse = await signUpController.signUpRequest();
          Future.delayed(Duration(milliseconds: 3500), () {
            setState(()  {
              this.currentState =  booleanResponse
                  ? ButtonState.success
                  : ButtonState.fail;
              Fluttertoast.showToast(
                  msg: signUpController.messageResponse.value,
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 3
              );
            });
            if(this.currentState == ButtonState.success){
              _signInFormController.emailController.text = signUpController.email;
              _signInFormController.passwordController.text = signUpController.password;
              signUpController.cleanFields();
              Navigator.pop(context);
            }
          });
        },
        
        state: currentState,
      )
    );
  }
}