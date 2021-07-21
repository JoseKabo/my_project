import 'package:flutter/material.dart';
import 'package:my_project/core/models/basicInfo.model.dart';
import 'package:my_project/pages/components/home/profile/components/updateInfo.component.dart';

InkWell buttonProfileShared({
    Color? kiBackgrounColor,
    Color? kiForegroundColor,
    IconData? kiIcon,
    String? text,
    String? action,
    required BuildContext context
  }) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kiBackgrounColor!,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              kiIcon!,
              color: kiForegroundColor,
              size: 18,
            ),
            SizedBox(width: 5,),
            Text(
              text!,
              style: TextStyle(
                color: kiForegroundColor,
                fontSize: 18,
                fontWeight: FontWeight.w700
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        (action!.endsWith('edit')) 
          ? _showUpdateForm(
            context
          ) 
          : _showUpdateForm(
            context
          );
      },
    );
  }

void _showUpdateForm(context){
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
        return UpdateInfo(
          scrollController: scrollController
        );
      },
    );
  });
}