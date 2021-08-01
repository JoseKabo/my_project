import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/update.controller.dart';
import 'package:my_project/pages/components/home/profile/widgets/updateButton.widget.dart';


Widget updateForm( BuildContext context ) {

  final size = MediaQuery.of(context).size;
  UpdateFormController updateFormController = Get.put(UpdateFormController());

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
                Form(
                  key: updateFormController.updateFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      _usernameInput(
                        updateFormController
                      ),
                      _emailInput(
                        updateFormController
                      ),
                      _birthdayInput(
                        updateFormController,
                        context
                      ),
                      _biographyInput(
                        updateFormController
                      ),
                      updateButton(
                        'Actualizar',
                        updateFormController,
                        context
                      ),
                    ],
                  )
                ),
                SizedBox(height: size.height * .40,)
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


Widget _biographyInput(
  UpdateFormController _updateFormController
){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            'Biografia',
            style: TextStyle(
              color: Colors.white70
            ),
          ),
        ),
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'Cuentanos sobre ti',
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
          maxLength: 240,
          controller: _updateFormController.biographyController,
          onSaved: (value) => _updateFormController.biography = value!,
        ),
      ],
    ),
  );
}

Widget _birthdayInput(
  UpdateFormController _updateFormController,
  BuildContext context
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
          onTap: () {
            _selectDate(context, _updateFormController.birthdayController);
          },
          readOnly: true,
          controller: _updateFormController.birthdayController,
          onSaved:  (value) => _updateFormController.birthday = value!,
        ),
      ],
    ),
  );
}

Widget _usernameInput(
  UpdateFormController _updateFormController
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
          maxLength: 75,
          controller: _updateFormController.usernameController,
          onSaved: (value) => _updateFormController.username = value!,
          validator:  (value) => _updateFormController.validateUsername(value!),
        ),
      ],
    ),
  );

  
}

Widget _emailInput(
  UpdateFormController _updateController
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
          controller: _updateController.emailController,
          onSaved: (value) => _updateController.email = value!,
          validator: (value) => _updateController.validateEmail(value!),
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