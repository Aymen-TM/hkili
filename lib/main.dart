import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hkili/constants.dart';
import 'package:hkili/controllers/AuthController.dart';
import 'package:hkili/utils/MyBindings.dart';
import 'package:hkili/views/HomePage.dart';
import 'package:hkili/views/LoginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await firebaseInitialization.then((value) => Get.put(AuthController()));
  } on PlatformException catch (err) {
  } catch (err) {}

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
        primaryColorDark: const Color(0xFF3C302A),
        primaryColorLight: const Color(0xFFE5E5E5),
        fontFamily: "eaglelake",
      ),
      initialBinding: MyBindings(),
      home: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      ),
    );
  }
}
