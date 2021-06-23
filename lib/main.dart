import 'package:flutter/material.dart';
import 'package:my_project/pages/components/login/signin/signin.page.dart';
 
import 'package:my_project/pages/shared/loginbackground.widget.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lis.to',
      initialRoute: 'AuthScreen',
      routes: {
        'AuthScreen': ( _ ) => SignInPage()
      },
    );
  }
} 