import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/signin.controller.dart';
import 'package:my_project/pages/components/login/signin/widgets/signin.widgets.dart';
import 'package:my_project/pages/shared/loginbackground.widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {

  SignInFormController signInFormController = Get.put(SignInFormController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          Center(
            child: SignInBody(context, signInFormController)
          ),
        ],
      ),
    );
  }
  
}