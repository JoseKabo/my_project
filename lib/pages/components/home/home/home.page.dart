import 'package:flutter/material.dart';


class HomePlayer extends StatefulWidget {

  @override
  _HomePlayerState createState() => _HomePlayerState();
}

class _HomePlayerState extends State<HomePlayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Hello World')
     ),
   );
  }
}