import 'package:flutter/material.dart';

class ViewProfilePicture extends StatelessWidget {
  const ViewProfilePicture({Key? key, required this.urlImage, required this.userId}) : super(key: key);

  final String urlImage;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: Navigator.of(context).pop,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: userId,
                    child: ClipOval(
                      child: Image.network(
                        urlImage,
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}