import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/core/models/stadistics.models.dart';
import 'package:my_project/pages/components/home/profile/widgets/viewpicture.widget.dart';

class PresentationCard extends StatelessWidget {
  PresentationCard({Key? key, required this.context, required this.username}) : super(key: key);
  final BuildContext context;
  final String username;

  ProfileController profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    print(username);
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
            backgroundImage: NetworkImage(
              "http://weesofts.com/assetspublics/posthinks/profile_posthinks.png",
            ),
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
      Column(
        children: [
          Container(
            child: FittedBox(
              fit: BoxFit.fill,
              child: Row(
                    children: [
                      Container(
                        child: Obx(
                          () => Text(
                          (username!.length > 10) ? "${username.substring(0, 9)}..." : "$username",
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Colors.white70
                          ),
                        ),
                        )
                      
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
                                  text: username ?? 'hola'
                                )
                              );
                              // print('you was copying $controller.user.username to clipboard');
                            },
                          ),
                        ),
                      )
                    ],
                  )
              
            ),
          ),
          SizedBox(height: 10,),
          // Container(
          //   child: FittedBox(
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Container(
          //           margin: EdgeInsets.all(8),
          //           child: Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   stadisticsModel!.posts.toString(),
          //                   style: TextStyle(
          //                     fontSize: 18,
          //                     color: Colors.white70,
          //                     fontWeight: FontWeight.w700
          //                   ),
          //                 ),
          //                 Text(
          //                   'Posthinks',
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     color: Colors.white54,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Container(
          //           margin: EdgeInsets.all(8),
          //           child: Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   stadisticsModel.likes.toString(),
          //                   style: TextStyle(
          //                     fontSize: 18,
          //                     color: Colors.white70,
          //                     fontWeight: FontWeight.w700
          //                   ),
          //                 ),
          //                 Text(
          //                   'Likes',
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     color: Colors.white54,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //         Container(
          //           margin: EdgeInsets.all(8),
          //           child: Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   stadisticsModel.trashes.toString(),
          //                   style: TextStyle(
          //                     fontSize: 18,
          //                     color: Colors.white70,
          //                     fontWeight: FontWeight.w700
          //                   ),
          //                 ),
          //                 Text(
          //                   'Trashes',
          //                   style: TextStyle(
          //                     fontSize: 12,
          //                     color: Colors.white54,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         )
          //       ],
          //     ),
          //   ),
          // )
        ],
      )
    ],  
  );
  }
}