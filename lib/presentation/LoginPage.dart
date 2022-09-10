import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/auth_state.dart';
import 'package:hkili/presentation/HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const rounteName = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  void loginWithGoogle() async {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    await authCubit.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          if (!state.loading) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (_) {
                  return Dialog(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Loading....")
                          ]),
                    ),
                  );
                });
          }
        } else if (state is Authenticated) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomePage()));
        }
      },
      builder: (context, state) {
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
                ])));
      },
    );
  }

  Widget SocialButton(BuildContext context, Icon icon, String socialmedia) {
    return ElevatedButton(
        onPressed: loginWithGoogle,
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
