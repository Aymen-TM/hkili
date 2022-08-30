import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkili/views/CategoryPage.dart';

class SideDrawerController extends GetxController {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    scaffoldKey.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey.currentState?.openEndDrawer();
  }

  drawerItemClick(category) {
    closeDrawer();
    Get.to(CategoryPage(), arguments: [
      {"category": category}
    ]);
  }
}
