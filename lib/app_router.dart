import 'package:flutter/material.dart';
import 'package:hkili/presentation/HomePage.dart';
import 'package:hkili/presentation/LoginPage.dart';

var appRoutes = <String, WidgetBuilder>{
  LoginPage.rounteName: (context) => LoginPage(),
  HomePage.rounteName: (context) => HomePage(),
};
