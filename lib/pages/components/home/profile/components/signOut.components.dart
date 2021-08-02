import 'package:flutter/material.dart';
import 'package:my_project/core/datasource/local.data.dart';
import 'package:my_project/pages/components/login/signin/signin.page.dart';
import 'package:my_project/shared/colors.dart';
class signOutButton extends StatelessWidget {
  const signOutButton({Key? key, required this.contextx}) : super(key: key);
  final BuildContext contextx;
  @override
  Widget build(BuildContext context) {
    LocalData _localData = new LocalData();
    return Container(
      alignment: Alignment.topRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26)
      ),
      child: Material(
        child: InkWell(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Cerrar sesion',
                  style: TextStyle(
                    color: ApplicationColors.kDangerColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 18
                  ),
                ),
              ],
            ),
          ),
          onTap: () async {
            showLoaderDialog(context);
            await _localData.clearData();
            Future.delayed(
              Duration(milliseconds: 2000),
              () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
                (Route<dynamic> route) => false,
              )
            );
          },
          splashColor: ApplicationColors.kDangerColor,
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Por favor espere..." )),
        ],),
    );
    showDialog(
      barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }
}