import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/shared/colors.dart';

void showRecoverDialog(context){
  showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text('Correo de recuperacion'),
      content: Card(
        color: Colors.transparent,
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            passwordInput(context)
          ],
        ),
      ),
      actions: [
        CupertinoDialogAction(
          child: Text(
            'Cerrar',
            style: TextStyle(
              color: Colors.redAccent
            ),
          ),
          onPressed: () => Navigator.pop(context)
        ),
        CupertinoDialogAction(
          child: Text(
            'Enviar',
            style: TextStyle(
              color: Colors.blueAccent
            ),
          ),
          onPressed: () {
          },
        ),
      ],
    )
  );
}

Widget passwordInput(BuildContext context){
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.white10,
            hintText: 'ej. juan@listo.com',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14
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
                color: ApplicationColors.kPrimaryColor,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          style: new TextStyle(
            fontFamily: "Poppins",
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
          cursorColor: ApplicationColors.kFocusInputColor,
          cursorRadius: Radius.circular(12),
          cursorHeight: 24,
          cursorWidth: 2.5,
        ),
      ],
    ),
  );
}
