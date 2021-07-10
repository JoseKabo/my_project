import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/newpost.controller.dart';
import 'package:my_project/pages/components/home/posting/widgets/button.widget.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({Key? key, required context}) : super(key: key);

  @override
  _PostingPageState createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  NewPostController newPostController = Get.put(NewPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          bottom: 30,
          left: 15,
          right: 15,
          top: 30
        ),
        child: SingleChildScrollView(
          child: Form(
            key: newPostController.postingFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                _descriptionField(newPostController),
                buttonPosting(
                  action: 'posting',
                  kiBackgrounColor: Colors.blueAccent,
                  kiForegroundColor: Colors.white,
                  kiIcon: CupertinoIcons.cloud_upload,
                  text: 'Publicar',
                  context: context,
                  newPostController: newPostController
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _descriptionField(
  NewPostController newPostController
){
  return Container(
    padding: EdgeInsets.all(8.00),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        new TextFormField(
          decoration: new InputDecoration(
            filled: true,
            fillColor: Colors.black12,
            hintText: 'Descripcion (opcional)',
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
                width: 2.0,
                style: BorderStyle.none
              )
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.blueAccent,
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
            errorStyle: TextStyle(
              color: Colors.red,
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
            errorBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.redAccent,
                width: 2.0,
                style: BorderStyle.solid
              )
            ),
          ),
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          maxLength: 330,
          style: new TextStyle(
            fontFamily: "Poppins",
            color: Colors.black87,
            fontWeight: FontWeight.w600
          ),
          cursorColor: Colors.blueAccent,
          cursorRadius: Radius.circular(12),
          cursorHeight: 24,
          cursorWidth: 2.5,
          controller: newPostController.descriptionController,
          onSaved: (value) => newPostController.description = value!,
          validator: (value) => newPostController.validateDescription(value!),
        ),
      ],
    ),
  );               
}