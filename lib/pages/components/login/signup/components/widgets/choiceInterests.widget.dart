
import 'package:flutter/material.dart';
import 'package:my_project/shared/colors.dart';
import 'package:progress_state_button/progress_button.dart';

import 'interestItem.widget.dart';

class ChoiceInterets extends StatefulWidget {
  ChoiceInterets({Key? key}) : super(key: key);


  @override
  _ChoiceInteretsState createState() => _ChoiceInteretsState();
}

class _ChoiceInteretsState extends State<ChoiceInterets> {
  List<Interests> interests = [
    Interests(1, 'Deportes', Icons.ballot),
    Interests(2, 'Musica', Icons.music_note),
    Interests(3, 'Comedia', Icons.face),
    Interests(5, 'Tecnologia', Icons.computer_rounded),
    Interests(6, 'Parejas', Icons.people_alt_rounded),
    Interests(7, 'Amor', Icons.health_and_safety_rounded),
    Interests(8, 'Familia', Icons.family_restroom),
  ];

  List<Interests> pickItems = [];


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            ...List.generate(
              interests.length,
              (index) => InterestItem(
                interest: interests[index],
                onSelected: (bool value) {
                  pickItems.contains(interests[index]) ? pickItems.remove(interests[index]) : pickItems.add(interests[index]);
                  setState(() {
                    print(pickItems.length);
                  });
                },
              )
            ),
            Container(
              padding: EdgeInsets.all(35.0),
              child: ProgressButton(
                stateWidgets: {
                  ButtonState.idle: Text("Comenzar a escuchar",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ButtonState.loading: Text("Loading",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ButtonState.fail: Text("Fail",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),),
                  ButtonState.success: Text("Success",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                },
                stateColors: {
                  ButtonState.idle: ApplicationColors.kSignInPrimaryButtonColor,
                  ButtonState.loading: Colors.blue.shade300,
                  ButtonState.fail: Colors.red.shade300,
                  ButtonState.success: Colors.green.shade400,
                },
                onPressed: () {
                  
                },
                state: ButtonState.idle,
              )
            ),
            Center(
              child:  Text(
                'Elige al menos uno',
                style: TextStyle(
                  color: Colors.white54
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }


}

class Interests {
  final int id;
  final String name;
  final IconData icon;

  Interests(this.id, this.name, this.icon);
}