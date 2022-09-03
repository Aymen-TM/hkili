import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Theme.of(context).primaryColorLight,
      child: SingleChildScrollView(
          child: Column(
        children: [buildHeader(context), buildMenuItems(context)],
      )),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Column(
      children: [
        menuItem("Action"),
        menuItem("Drama"),
        menuItem("Horror"),
        menuItem("Crime"),
        menuItem("History"),
        menuItem("Adventure"),
      ],
    );
  }

  Widget menuItem(String category) {
    return ListTile(
      title: Text(
        category,
        style: const TextStyle(
            fontFamily: "sans", fontWeight: FontWeight.w400, fontSize: 16),
      ),
      onTap: () {},
    );
  }
}
