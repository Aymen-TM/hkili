import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkili/utils/MyBindings.dart';
import 'package:hkili/views/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: Color(0xFF3C302A),
        primaryColorLight: Color(0xFFE5E5E5),
        fontFamily: "eaglelake",
      ),
      initialBinding: MyBindings(),
      home: HomePage(),
    );
  }
}
