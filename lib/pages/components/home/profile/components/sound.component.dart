import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';


Center soundItem({
  String? id = 'x',
  String? description = 'test',
  int? likes = 0,
  int? trashes = 0,
  DateTime? posted
}) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('http://weesofts.com/assetspublics/posthinks/bkg_posthinks.png'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(17),
          color: Colors.blueAccent
        ),
        child: Center(
          child: Container(
            margin: EdgeInsets.only(
              bottom: 20,
              top: 20
            ),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(25),
              color: Colors.black38
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    description!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                      color: Colors.white
                    ),
                  ),
                ),
                // Container(
                // alignment: Alignment.center,
                // padding: EdgeInsets.only(
                //   left: 30,
                //   right: 30
                // ),
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //     children: [
                //       LikeButton(
                //         circleColor: CircleColor(
                //           start: Color(0xff00ddff), 
                //           end: Color(0xff0099cc)
                //         ),
                //         bubblesColor: BubblesColor(
                //           dotPrimaryColor: Color(0xff33b5e5),
                //           dotSecondaryColor: Color(0xff0099cc),
                //         ),
                //         likeBuilder: (bool isLiked) {
                //           return Icon(
                //             CupertinoIcons.bolt_fill,
                //             color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                //             size: 27,
                //           );
                //         },
                //         likeCount: likes,
                //         countBuilder: (int? count, bool isLiked, String text) {
                //           var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                //           Widget result;
                //           if (count == 0) {
                //             result = Text(
                //               "Like",
                //               style: TextStyle(color: color),
                //             );
                //           } else
                //             result = Text(
                //               text,
                //               style: TextStyle(color: color),
                //             );
                //           return result;
                //         },
                //       ),

                //       LikeButton(
                //         circleColor: CircleColor(
                //           start: Color(0xff00ddff), 
                //           end: Color(0xff0099cc)
                //         ),
                //         bubblesColor: BubblesColor(
                //           dotPrimaryColor: Color(0xff33b5e5),
                //           dotSecondaryColor: Color(0xff0099cc),
                //         ),
                //         likeBuilder: (bool isLiked) {
                //           return Icon(
                //             CupertinoIcons.delete,
                //             color: isLiked ? Colors.redAccent : Colors.grey,
                //             size: 27,
                //           );
                //         },
                //         likeCount: trashes,
                //         countBuilder: (int? count, bool isLiked, String text) {
                //           var color = isLiked ? Colors.redAccent : Colors.grey;
                //           Widget result;
                //           if (count == 0) {
                //             result = Text(
                //               "Trash",
                //               style: TextStyle(color: color),
                //             );
                //           } else
                //             result = Text(
                //               text,
                //               style: TextStyle(color: color),
                //             );
                //           return result;
                //         },
                //       ),
                //     ],
                //   ),
                // )
              ],
            ),
          ),
        ),
      )
    );
  }