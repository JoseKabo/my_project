import 'package:flutter/material.dart';
import 'package:my_project/pages/components/login/signup/widgets/body.widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key, ScrollController? scrollController}) : super(key: key);

  get scrollController => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(25.0),
            topLeft: const Radius.circular(25.0)
          ),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              Color(0xFF2C061F),
              Color(0xFF060930),
            ]
          ),
        ),
        padding: EdgeInsets.all(15),
        child: ListView(
          controller: scrollController,
          children: [
            signUpBody(context)
          ],
        ),
      ),
    );
  }
}