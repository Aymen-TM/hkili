import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 24),
          child: SizedBox(
            width: 315,
            height: 32,
            child: TextField(
              style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "montserrat",
                  height: 1.0,
                  color: Colors.black),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 0),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 16,
                  color: Color(0xFF666666),
                ),
                hintText: "search user",
                hintStyle: TextStyle(fontFamily: "montserrat"),
                fillColor: Theme.of(context).primaryColorLight,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(
                      width: 2, color: Theme.of(context).primaryColorDark),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  borderSide: BorderSide(width: 2, color: Color(0xFF666666)),
                ),
              ),
              cursorColor: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ],
    );
  }
}
