import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/auth_state.dart';
import 'package:hkili/presentation/HomePage.dart';
import 'package:hkili/presentation/LoginPage.dart';
import 'package:hkili/utils/transitions/FadeInRoute.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.isLoggedIn();
    navigate(authCubit);
  }

  navigate(authCubit) async {
    await Future.delayed(
        Duration(milliseconds: 1000),
        () => {
              if (authCubit.state is Authenticated)
                {
                  Navigator.of(context).pushReplacement(
                      FadeInRoute(page: HomePage(), routeName: "/home"))
                }
              else
                {
                  Navigator.of(context).pushReplacement(
                      FadeInRoute(page: LoginPage(), routeName: "/login"))
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Hkili",
                  style: TextStyle(
                      fontSize: 64,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFFEEEEEE)))
            ]),
      ),
    );
  }
}
