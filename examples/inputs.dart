
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget SignInForm( BuildContext context ){

  final size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Column(
      children: [
        SafeArea(
          child: Container(
            width: size.width * 0.85,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric( vertical: 50.0 ),
            child: Column(
              children: [
                new TextFormField(
                  decoration: new InputDecoration(
                    // labelText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.white10,
                    labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 25
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Correo electronico',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                    ),
                    alignLabelWithHint: true,
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
                    // suffix: Container(
                    //   // margin: EdgeInsets.all(10),
                    //   child: RaisedButton(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //       side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))
                    //     ),
                    //     onPressed: () {},
                    //     color: Colors.white,
                    //     textColor: Color.fromRGBO(0, 160, 227, 1),
                    //     child: Text("Show",
                    //       style: TextStyle(fontSize: 12)
                    //     ),
                    //   ),
                    // ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                    labelText: "Enter Email",
                    fillColor: Colors.white,
                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                      borderSide: new BorderSide(
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 3.0,
                        style: BorderStyle.solid
                      )
                    )
                  ),
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                    fontFamily: "Poppins",
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}