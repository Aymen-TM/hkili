import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "test",
        style: TextStyle(fontFamily: "Montserrat"),
      )),
      backgroundColor: Theme.of(context).primaryColorDark,
    );
  }
}
