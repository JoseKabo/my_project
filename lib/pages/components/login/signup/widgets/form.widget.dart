import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_state_button/progress_button.dart';

import 'package:my_project/shared/colors.dart';


Widget signUpForm( BuildContext context ){

  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
          child: Container(
            width: size.width * 0.99,
            // margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.only(
              top: 20.0
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _nameInput(),
                _birthdayInput(),
                _usernameInput(),
                _emailInput(),
                _passwordInput(),
                signUpButton(),
                SizedBox(height: size.height * .40,)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget signUpButton(){
  return Container(
    padding: EdgeInsets.only(
      top: 25,
      bottom: 15
    ),
    child: ProgressButton(
      stateWidgets: {
        ButtonState.idle: Text("CREAR CUENTA",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
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

Widget _nameInput(){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Nombre completo',
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'ej. Juan Perez Hernandez',
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
          keyboardType: TextInputType.name,
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

Widget _birthdayInput(){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Fecha de nacimiento',
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'ej. 06/06/1999',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
            prefixIcon: Icon(
              Icons.cake,
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
          keyboardType: TextInputType.datetime,
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

Widget _usernameInput(){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Nombre de usuario',
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'ej. juancho123',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
            prefixIcon: Icon(
              Icons.alternate_email_rounded,
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
          keyboardType: TextInputType.name,
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

Widget _passwordInput(){
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
            ],
          ),
        ),
        TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'ej. Juan6P*#',
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
      ],
    ),
  );
}

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
            hintText: 'ej. juan@listo.com',
            hintStyle: TextStyle(
              color: Colors.white70,
              fontSize: 14
            ),
            prefixIcon: Icon(
              Icons.email_rounded,
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