import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkili/components/NavigationDrawer.dart';
import 'package:hkili/controllers/SideDrawerController.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final drawerController = Get.put(SideDrawerController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideDrawerController>(builder: (drawerController) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Theme.of(context).primaryColorDark,
          leading: IconButton(
            icon: FaIcon(FontAwesomeIcons.bars),
            onPressed: () => {drawerController.openDrawer()},
          ),
        ),
        key: drawerController.scaffoldKey,
        drawer: NavigationDrawer(),
        body: const Center(
            child: Text(
          "hello",
          style: TextStyle(
            fontSize: 50,
          ),
        )),
      );
    });
  }
}
