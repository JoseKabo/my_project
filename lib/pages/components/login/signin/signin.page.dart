import 'package:flutter/material.dart';
import 'package:my_project/pages/components/login/signin/widgets/signin.widgets.dart';
import 'package:my_project/pages/shared/loginbackground.widget.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          Center(
            child: SignInForm(context)
          )
        ],
      ),
    );
  }
}