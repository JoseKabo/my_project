import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_project/pages/components/login/forgotPassword/forgotpassword.page.dart';
import 'package:my_project/pages/components/login/signin/widgets/signinbutton.widget.dart';
import 'package:my_project/pages/components/login/signup/signup.page.dart';

import 'package:my_project/pages/components/login/signin/widgets/socialbutton.widget.dart';
import 'package:my_project/pages/components/login/signin/widgets/title.signin.widget.dart';
// ignore: non_constant_identifier_names
Widget SignInBody( BuildContext context ){

  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
          child: Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.only(
              top: 50.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleSignIn(context),
                _emailInput(),
                _passwordInput(context),
                signInButton(),
                _socialButtons(size),
                SizedBox(height: 50,),
                _signUpButton(context, size)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _signUpButton(BuildContext context, Size size){
  return Center(
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Colors.amber,
        borderRadius: BorderRadius.circular(15)
      ),
      child: InkWell(
        splashColor: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_upward_rounded, color: Colors.white60,),
            Text('Registrarse', style: TextStyle(color: Colors.white54),)
          ],
        ),
        onTap: () {
          _showSignUpForm(context);
        },
      ),
    ),
  );
}

void _showSignUpForm(context){
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context)
    {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 1,
      minChildSize: 0.25,
      builder: (
        BuildContext context,
        ScrollController scrollController
      ){
        return SignUpPage(
          scrollController: scrollController,
        );
      },
    );
  });
}

Widget _socialButtons(Size size){
  return Container(
    alignment: Alignment.center,
    child: Column(
      children: [
        Text(
          'conectar con',
          style: TextStyle(
            color: Colors.white70
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            socialButtonConnect(
              social: 'facebook',
              socialIcon: FaIcon(FontAwesomeIcons.facebookF).icon,
            ),
            socialButtonConnect(
              social: 'google',
              socialIcon: FaIcon(FontAwesomeIcons.google).icon,
            )
          ],
        ),
      ],
    ),
  );
}

Widget _passwordInput(BuildContext context){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Contraseña',
                style: TextStyle(
                  color: Colors.white70
                ),
              ),
              // Row(
              //   children: [
              //     Text('Mostrar'),
              //     Switch(
              //       activeColor: ApplicationColors.kDangerColor,
              //       inactiveTrackColor: ApplicationColors.kPrimaryColor,
              //       value: true,
              //       onChanged: (bool value) {}
              //     )
              //   ],
              // ),
            ],
          ),
        ),
        TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'Contraseña',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
            prefixIcon: Icon(
              Icons.password,
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.none
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
          ),
          keyboardType: TextInputType.text,
          style: new TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          obscureText: true,
          obscuringCharacter: '■',
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(12),
          cursorHeight: 24,
          cursorWidth: 2.5,
        ),
        // BUTTON I FORGET MY PASSWORD
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              showRecoverDialog(context);
            }, 
            child: Text(
              'Olvide mi contraseña',
              style: TextStyle(
                  color: Colors.white70
              ),
            )
          ),
        )
      ],
    ),
  );
}

// void _showRecoverDialog(context){
//   showCupertinoDialog(
//       context: context,
//       builder: (context) => CupertinoAlertDialog(
//         title: Text('Correo de recuperacion'),
//         actions: [
//           CupertinoDialogAction(
//             child: Text('Close'),
//             onPressed: () => Navigator.pop(context)
//           ),
//         ],
//       )
//     );
// }

Widget _emailInput(){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Correo electronico',
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'Correo electronico',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white70,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.none
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.white,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontWeight: FontWeight.w600
          ),
          cursorColor: Colors.white,
          cursorRadius: Radius.circular(12),
          cursorHeight: 24,
          cursorWidth: 2.5,
        ),
      ],
    ),
  );
                
}