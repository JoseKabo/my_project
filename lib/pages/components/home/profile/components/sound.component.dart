import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter/material.dart';


Center soundItem({
  String? id,
  String? description,
  int? likes,
  int? trashes,
  DateTime? posted
}) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(13),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://scontent.frex1-1.fna.fbcdn.net/v/t1.6435-9/168148235_270690767975965_609758644320952063_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=e3f864&_nc_eui2=AeEpfQm31KR4wnqf-cG9-aHIh83euUI0QtCHzd65QjRC0C2hssdF66nLuvxJxfrCqxwD4_9AQltHpvanX_F3JwQa&_nc_ohc=C7zG9ojBm-kAX_U-VpO&tn=gSoABmlHaKstQ5ru&_nc_ht=scontent.frex1-1.fna&oh=78f14c93dc8e74f012b12ee79b602e40&oe=60EA2C36'),
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
                      color: Colors.white70
                    ),
                  ),
                ),
                Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  left: 30,
                  right: 30
                ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      LikeButton(
                        circleColor: CircleColor(
                          start: Color(0xff00ddff), 
                          end: Color(0xff0099cc)
                        ),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color(0xff33b5e5),
                          dotSecondaryColor: Color(0xff0099cc),
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            CupertinoIcons.bolt_fill,
                            color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                            size: 27,
                          );
                        },
                        likeCount: likes,
                        countBuilder: (int? count, bool isLiked, String text) {
                          var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "Like",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),

                      LikeButton(
                        circleColor: CircleColor(
                          start: Color(0xff00ddff), 
                          end: Color(0xff0099cc)
                        ),
                        bubblesColor: BubblesColor(
                          dotPrimaryColor: Color(0xff33b5e5),
                          dotSecondaryColor: Color(0xff0099cc),
                        ),
                        likeBuilder: (bool isLiked) {
                          return Icon(
                            CupertinoIcons.delete,
                            color: isLiked ? Colors.redAccent : Colors.grey,
                            size: 27,
                          );
                        },
                        likeCount: trashes,
                        countBuilder: (int? count, bool isLiked, String text) {
                          var color = isLiked ? Colors.redAccent : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "Trash",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }