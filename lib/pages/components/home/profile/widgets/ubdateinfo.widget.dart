import 'package:flutter/material.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/pages/components/home/profile/widgets/updateForm.widget.dart';
import 'package:my_project/pages/shared/simpleElements/topheadersheet.widget.dart';

Widget updateInfoBody(
  BuildContext context
) {
  final size = MediaQuery.of(context).size;

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      topSheetElement(size),
      topTitleSheetElement(title: 'Actualizar información', size: size),
      updateForm(context)
    ],
  );
}