import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/signup.controller.dart';
import 'package:my_project/pages/components/login/signup/components/widgets/signupbtn.widget.dart';


Widget signUpForm( BuildContext context ){

  final size = MediaQuery.of(context).size;
  SignUpController signUpController = Get.put(SignUpController());

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
            child: Form(
              key: signUpController.signUpFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _nameInput(
                    signUpController
                  ),
                  _birthdayInput(
                    context,
                    signUpController
                  ),
                  _usernameInput(
                    signUpController
                  ),
                  _emailInput(
                    signUpController
                  ),
                  _passwordInput(
                    signUpController
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SignUpButton(),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * .40,)
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _nameInput(
  SignUpController _signUpController
){
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
            ), errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            counterStyle: TextStyle(
              color: Colors.white70
            )
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
          maxLength: 75,
          controller: _signUpController.nameController,
          onSaved: (value) => _signUpController.name = value!,
        ),
      ],
    ),
  );
}

Widget _birthdayInput(
  BuildContext context,
  SignUpController signUpController
){
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
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
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
          readOnly: true,
          controller: signUpController.birthdayController,
          onSaved:  (value) => signUpController.birthday = value!,
          validator: ( value) => signUpController.validateBirthday(value: (value!.length < 2) ? '2010-01-01' : value ),
          onTap: () {
            _selectDate(context, signUpController.birthdayController);
          },
        ),
      ],
    ),
  );
}

Future<DateTime?> _selectDate(
  BuildContext context,
  TextEditingController birthdayController
) async {
  DateTime selectedDate = DateTime.now();
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      locale: Locale(
        'es'
      ),
      firstDate: DateTime(1985, 8),
      lastDate: DateTime(2025));
  if (picked != null && picked != selectedDate) {
    birthdayController.text = picked.toLocal().toString().split(' ')[0];
    return picked.toLocal();
  }
  return selectedDate.toLocal();
}

Widget _usernameInput(
  SignUpController _signUpController
){
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
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            counterStyle: TextStyle(
              color: Colors.white70
            )
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
          maxLength: 10,
          controller: _signUpController.usernameController,
          onSaved: (value) => _signUpController.username = value!,
          validator:  (value) => _signUpController.validateUsername(value!),
        ),
      ],
    ),
  );
}

Widget _passwordInput(
  SignUpController _signUpController
){
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
            hintText: 'ej. JuanPo6*',
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
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            counterStyle: TextStyle(
              color: Colors.white70
            )
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
          maxLength: 8,
          controller: _signUpController.passwordController,
          onSaved: (value) => _signUpController.password = value!,
          validator: (value) => _signUpController.validatePassword(value!),
        ),
      ],
    ),
  );
}

Widget _emailInput(
  SignUpController _signUpController
){
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
            errorStyle: TextStyle(
              color: Colors.redAccent,
              fontWeight: FontWeight.bold
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
            counterStyle: TextStyle(
              color: Colors.white70
            )
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
          maxLength: 75,
          controller: _signUpController.emailController,
          onSaved: (value) => _signUpController.email = value!,
          validator: (value) => _signUpController.validateEmail(value!),
        ),
      ],
    ),
  );
}