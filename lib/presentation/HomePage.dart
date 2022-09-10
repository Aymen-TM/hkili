import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/auth_state.dart';
import 'package:hkili/BL/cubit/fire_store_cubit.dart';
import 'package:hkili/components/NavigationDrawer.dart';
import 'package:hkili/components/SearchBar.dart';
import 'package:hkili/components/StoryCard.dart';
import 'package:hkili/data/models/Story.dart';
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

  final Stream<QuerySnapshot> stories =
      FirebaseFirestore.instance.collection('stories').snapshots();

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
                icon: const Icon(Icons.sort_rounded),
                onPressed: () => {},
                iconSize: 32,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () => {
                Navigator.of(context)
                    .pushNamed("/post")
                    .then((f) => setState(() {}))
              },
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
                    BlocProvider.of<AuthCubit>(context).currentUser()!.photo!),
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
          child: StreamBuilder<QuerySnapshot>(
              stream: BlocProvider.of<FireStoreCubit>(context).getAllStories(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                return Container(
                  child: Column(
                    children: [
                      SearchBar(),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return StoryCard(
                                story: Story.fromFirestore(
                                    snapshot.data!.docs[index]),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 24,
                              );
                            },
                            itemCount: snapshot.data!.docs.length),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
