import 'package:get/get.dart';
import 'package:hkili/controllers/SideDrawerController.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SideDrawerController>(SideDrawerController());
  }
}
