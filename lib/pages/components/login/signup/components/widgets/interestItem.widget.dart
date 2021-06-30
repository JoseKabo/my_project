import 'package:flutter/material.dart';
import 'package:my_project/shared/colors.dart';

import 'choiceInterests.widget.dart';

class InterestItem extends StatefulWidget {
  const InterestItem({
    Key? key,
    this.interests,
    this.interest ,
    this.onSelected,
  }) : super(key: key);

  final List<Interests>? interests;
  final Interests? interest;
  final ValueChanged<bool>? onSelected;

  @override
  _InterestItemState createState() => _InterestItemState();
}

class _InterestItemState extends State<InterestItem> {

  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
          widget.onSelected!(_isSelected);
        });
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: _isSelected ? Border.all(
                  width: 2.0,
                  color: ApplicationColors.kSignInPrimaryButtonColor
                ) : null,
              ),
              child: Icon(
                widget.interest?.icon,
                size: 32.0,
                color: _isSelected ? ApplicationColors.kSignInPrimaryButtonColor : Colors.white70,
              ),
            ),
            SizedBox(height: 12.0,),
            Text(
              widget.interest!.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _isSelected ? ApplicationColors.kSignInPrimaryButtonColor : Colors.white70,
              ),
            )
    
          ],
        ),
      ),
    );
  }
}