import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/pages/components/home/profile/widgets/ubdateinfo.widget.dart';

class UpdateInfo extends StatefulWidget {
  const UpdateInfo({
    Key? key, 
    ScrollController? scrollController,
  }) : super(key: key);

  @override
  _UpdateInfoState createState() => _UpdateInfoState();
}

class _UpdateInfoState extends State<UpdateInfo> {
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
            updateInfoBody(context)
          ],
        ),
      ),
    );
  }
}