import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/pages/components/home/posting/widgets/button.widget.dart';

class PostingPage extends StatelessWidget {
  const PostingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        bottomOpacity: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Publicar',
          style: TextStyle(
            color: Colors.black87
          ),
        ),
        leading: IconButton(
          icon: new Icon(
            Icons.close_rounded,
          ),
          color: Colors.redAccent,
          onPressed: () {
            print('back');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          bottom: 30,
          left: 15,
          right: 15,
          top: 30
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _descriptionField(),
              buttonPosting(
                action: 'posting',
                kiBackgrounColor: Colors.blueAccent,
                kiForegroundColor: Colors.white,
                kiIcon: CupertinoIcons.cloud_upload,
                text: 'Publicar'
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _descriptionField(){
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
          ),
          maxLines: 8,
          keyboardType: TextInputType.multiline,
          style: new TextStyle(
            fontFamily: "Poppins",
            color: Colors.black87,
            fontWeight: FontWeight.w600
          ),
          cursorColor: Colors.blueAccent,
          cursorRadius: Radius.circular(12),
          cursorHeight: 24,
          cursorWidth: 2.5,
        ),
      ],
    ),
  );               
}