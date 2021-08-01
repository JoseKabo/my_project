import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:my_project/controllers/profile.controller.dart';
import 'package:my_project/pages/components/home/main.page.dart';
import 'package:my_project/pages/components/home/posting/posting.page.dart';
import 'package:my_project/pages/components/home/posting/widgets/recording.widget.dart';
import 'package:my_project/pages/components/home/profile/profile.page.dart';
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
      initialRoute: 'AuthScreen',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''), // English, no country code
        const Locale('es', ''), // Spanish, no country code
      ],
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.transparent,
      ),
      routes: {
        'AuthScreen': ( _ ) => SignInPage(),
        'InterestsScreen': ( _ ) => InterestsPage(),
        'MyProfile': ( __ ) => ProfilePage(),
        'Main': ( __ ) => MainPage(),
      },
    );
  }
} 