import 'package:get/get.dart';
import 'package:hkili/controllers/CategoryController.dart';
import 'package:hkili/controllers/HomeController.dart';
import 'package:hkili/controllers/SideDrawerController.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideDrawerController>(
      () => SideDrawerController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
