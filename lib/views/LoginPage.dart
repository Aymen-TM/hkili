import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hkili/constants.dart';
import 'package:hkili/views/HomePage.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF1E1815),
            Color(0xFF3C302A),
          ],
        )),
        child: Column(children: [
          SizedBox(
            height: 200,
          ),
          Column(
            children: [
              Text(
                "Hkili",
                style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEEEEEE)),
              ),
              Text("tell us your story",
                  style: TextStyle(
                      fontSize: 20,
                      height: -0.1,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFEEEEEE)))
            ],
          ),
          SizedBox(
            height: 280,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SocialButton(
                  context,
                  Icon(
                    FontAwesome.google_plus_circle,
                  ),
                  "GOOGLE"),
              SizedBox(
                height: 8,
              ),
              SocialButton(
                  context,
                  Icon(
                    Icons.facebook_rounded,
                  ),
                  "FACEBOOK")
            ],
          ),
        ]),
      ),
    );
  }

  Widget SocialButton(BuildContext context, Icon icon, String socialmedia) {
    return ElevatedButton(
        onPressed: () => {authController.signInWithGoogle()},
        style: ElevatedButton.styleFrom(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).primaryColorDark,
            ),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100.0),
            ),
            fixedSize: Size.fromHeight(50),
            primary: Color(0xFF3F2E26)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              icon,
              SizedBox(
                width: 35,
              ),
              Text(
                "LOG IN WITH $socialmedia",
                style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
