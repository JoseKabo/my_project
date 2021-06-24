import 'package:flutter/material.dart';
import 'package:my_project/pages/components/login/signin/signin.page.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lis.to',
      initialRoute: 'AuthScreen',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.transparent,
      ),
      routes: {
        'AuthScreen': ( _ ) => SignInPage()
      },
    );
  }
} 