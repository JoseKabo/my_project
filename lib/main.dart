import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_project/pages/components/login/signin/signin.page.dart';
import 'package:my_project/pages/components/login/signup/components/interests.component.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lis.to',
      initialRoute: 'InterestsScreen',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
        canvasColor: Colors.transparent,
      ),
      routes: {
        'AuthScreen': ( _ ) => SignInPage(),
        'InterestsScreen': ( _ ) => InterestsPage()
      },
    );
  }
} 