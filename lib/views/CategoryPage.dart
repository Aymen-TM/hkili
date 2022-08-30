import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hkili/controllers/CategoryController.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  CategoryController categoryController = Get.put(CategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<CategoryController>(builder: (controller) {
          return Text(
            controller.category,
            style: TextStyle(fontFamily: "Montserrat"),
          );
        }),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
