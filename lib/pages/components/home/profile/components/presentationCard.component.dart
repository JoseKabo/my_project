import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/pages/components/home/profile/widgets/viewpicture.widget.dart';

Row presentationCard(
  BuildContext context,
  {
    String? username
  }
) {
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
              "https://scontent.frex1-1.fna.fbcdn.net/v/t1.6435-9/167319593_270686221309753_1217886808624443140_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHkUTuLHDIk0QDmPs5vEY3QfQw1SUZd2UB9DDVJRl3ZQJbx1o5sV_xhmjf9_Be1jL9WKIO-W5y-IiJqJlfDR0Jc&_nc_ohc=kyJ92E77VS4AX-1D4RO&_nc_ht=scontent.frex1-1.fna&oh=6b670976786da12b88ea37cd9e89b50f&oe=60EB99A7",
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
                    urlImage: "https://scontent.frex1-1.fna.fbcdn.net/v/t1.6435-9/167319593_270686221309753_1217886808624443140_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHkUTuLHDIk0QDmPs5vEY3QfQw1SUZd2UB9DDVJRl3ZQJbx1o5sV_xhmjf9_Be1jL9WKIO-W5y-IiJqJlfDR0Jc&_nc_ohc=kyJ92E77VS4AX-1D4RO&_nc_ht=scontent.frex1-1.fna&oh=6b670976786da12b88ea37cd9e89b50f&oe=60EB99A7",
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
                    child: Text(
                      (username!.length > 10) ? '@${username.substring(0, 9)}...' : '@$username',
                      maxLines: 1,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Colors.white70
                      ),
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
                              text: username
                            )
                          );
                          print('you was copying $username to clipboard');
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: FittedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '2456',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            'Seguidores',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '2456',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            'Siguiendo',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            '2456',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                              fontWeight: FontWeight.w700
                            ),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )
    ],  
  );
}
