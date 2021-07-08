import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Center soundItem() {
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
            margin: EdgeInsets.all(50),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black38
            ),
            alignment: Alignment.center,
            child: IconButton(
              icon: new Icon(CupertinoIcons.play_arrow_solid),
              color: Colors.white,
              alignment: Alignment.center,
              splashColor: Colors.amber,
              iconSize: 30.0,
              onPressed: () {
                print('play');
              },
            ),
          ),
        ),
      )
    );
  }