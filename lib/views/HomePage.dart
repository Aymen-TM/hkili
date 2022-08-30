import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';
import 'package:hkili/components/NavigationDrawer.dart';
import 'package:hkili/components/SearchBar.dart';
import 'package:hkili/components/StoryCard.dart';
import 'package:hkili/controllers/HomeController.dart';
import 'package:hkili/controllers/SideDrawerController.dart';
import 'package:hkili/views/PostPage.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final drawerController = Get.put(SideDrawerController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideDrawerController>(builder: (drawerController) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Hkili",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorDark,
            leading: IconButton(
              icon: const Icon(FontAwesome5.bars),
              onPressed: () => {drawerController.openDrawer()},
            ),
            actions: [
              IconButton(
                onPressed: () => {Get.to(PostPage())},
                icon: Icon(CupertinoIcons.plus_square),
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {},
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
          key: drawerController.scaffoldKey,
          drawer: NavigationDrawer(),
          body: ListView.separated(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return index == 0
                    ? SearchBar()
                    : GetBuilder<HomeController>(
                        id: index.toString(),
                        builder: (homeController) {
                          return StoryCard(tag: index.toString());
                        });
              },
              separatorBuilder: (context, index) {
                return index == 0
                    ? SizedBox(
                        height: 0,
                      )
                    : SizedBox(
                        height: 24,
                      );
              }));
    });
  }
}
