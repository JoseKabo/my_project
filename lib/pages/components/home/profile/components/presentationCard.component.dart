import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/pages/components/home/profile/widgets/viewpicture.widget.dart';

class PresentationCard extends StatelessWidget {
  PresentationCard({Key? key, required this.context}) : super(key: key);
  final BuildContext context;

  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    var username = profileController.user.value.username.obs;
    return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      InkWell(
        highlightColor: Colors.pinkAccent,
        child: Container(
          margin: EdgeInsets.only(
            right: 10
          ),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/img/profile_posthinks.png'),
            radius: 45.0,
          ),
        ),
        onTap: (){
          Navigator.of(context).push(
            PageRouteBuilder(
              barrierColor: Colors.black45,
              barrierDismissible: true,
              opaque: false,
              pageBuilder: (context, _animation, _)  =>
                FadeTransition(
                  opacity: _animation,
                  child: ViewProfilePicture(
                    urlImage: "http://weesofts.com/assetspublics/posthinks/profile_posthinks.png",
                    userId: 'ase13423',
                  ),
                ),
              
            )
          );
        },
      ),
      Container(
        child: Row(
          children: [
            Text(
              username.value ?? "Mi perfil",
              maxLines: 1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 25,
                color: Colors.white70
              ),
            ),
            SizedBox(width: 10,),
              Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: InkWell(
                    splashColor: Colors.blueAccent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.copy, color: Colors.white60, size: 14,),
                      ],
                    ),
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(
                          text: username.value ?? 'hola'
                        )
                      );
                      // print('you was copying $controller.user.username to clipboard');
                    },
                  ),
                ),
              )
          ],
        ),
      )
    ],  
  );
  }
}