import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/app_router.dart';

import 'package:hkili/data/repository/auth_repository.dart';
import 'package:hkili/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  late FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late GoogleSignIn googleSignIn = GoogleSignIn();
  runApp(BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
        FirebaseAuthRepo(auth: firebaseAuth, googleSignIn: googleSignIn)),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColorDark: const Color(0xFF3C302A),
        primaryColorLight: const Color(0xFFE5E5E5),
        fontFamily: "eaglelake",
      ),
      routes: appRoutes,
    );
  }
}
