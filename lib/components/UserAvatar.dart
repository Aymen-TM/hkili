import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key, required this.userPhoto}) : super(key: key);
  final String? userPhoto;
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType
            .transparency, //Makes it usable on any background color, thanks @IanSmith
        child: Ink(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              //This keeps the splash effect within the circle
              borderRadius: BorderRadius.circular(
                  1000.0), //Something large to ensure a circle
              onTap: () => {},
              child: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorLight,
                foregroundImage: NetworkImage(userPhoto!),
              ),
            )));
  }
}
