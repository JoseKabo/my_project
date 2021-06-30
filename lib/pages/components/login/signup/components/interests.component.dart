import 'package:flutter/material.dart';
import 'package:my_project/pages/components/login/signup/components/widgets/choiceInterests.widget.dart';
import 'package:my_project/pages/components/login/signup/components/widgets/interestTitle.widget.dart';
import 'package:my_project/pages/shared/loginbackground.widget.dart';

class InterestsPage extends StatefulWidget {
  InterestsPage({Key? key}) : super(key: key);

  @override
  _InterestsPageState createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SafeArea(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: EdgeInsets.only(
                        top: 50.0
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          interestTitle(context),
                          SizedBox(height: 35,),
                          ChoiceInterets(),
                          SizedBox(height: 20,),
                          
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}





