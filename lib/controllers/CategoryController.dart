import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  String category = "";
  List categories = [
    "Action",
    "Comedy",
    "Horror",
    "Adventure",
    "Crime",
  ].obs;

  String selectedValue = "Action";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    category = Get.arguments[0]["category"];
    update();
    super.onReady();
  }

  dropDownCallBack(String? _selectedValue) {
    selectedValue = _selectedValue!;
  }
}
