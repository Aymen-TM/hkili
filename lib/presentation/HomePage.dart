import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/auth_state.dart';
import 'package:hkili/components/NavigationDrawer.dart';
import 'package:hkili/components/SearchBar.dart';
import 'package:hkili/components/StoryCard.dart';
import 'package:hkili/presentation/LoginPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const rounteName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  logout() {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    authCubit.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hkili",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return IconButton(
                icon: const Icon(FontAwesome5.bars),
                onPressed: () => {},
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: Icon(CupertinoIcons.plus_square),
              iconSize: 30,
            ),
            IconButton(
              onPressed: () => logout(),
              icon: CircleAvatar(
                backgroundColor: Theme.of(context).primaryColorLight,
                child: Icon(
                  FontAwesome5.user,
                  color: Colors.white,
                ),
                foregroundImage: NetworkImage(
                    "https://ichef.bbci.co.uk/news/976/cpsprodpb/14B1D/production/_125556748_gettyimages-1240422158.jpg"),
              ),
            )
          ],
        ),
        drawer: NavigationDrawer(),
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is NotAuthenticated) {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
          child: ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return SearchBar();
                } else {
                  return StoryCard();
                }
              },
              separatorBuilder: (context, index) {
                return index == 0
                    ? SizedBox(
                        height: 0,
                      )
                    : SizedBox(
                        height: 24,
                      );
              }),
        ));
  }
}
