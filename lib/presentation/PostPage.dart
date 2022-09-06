import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/fire_store_cubit.dart';
import 'package:hkili/data/models/Story.dart';

class PostPage extends StatefulWidget {
  PostPage({Key? key}) : super(key: key);

  static const rounteName = '/post';

  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var postController = TextEditingController();
  var categories = ["Action", "Drama", "Crime", "Comedy", "Horror", "History"];
  String? selectedVlaue = "Action";

  @override
  Widget build(BuildContext context) {
    final currentUser = BlocProvider.of<AuthCubit>(context).currentUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hkili",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Icon(
                  CupertinoIcons.plus_square,
                  size: 24,
                ),
                SizedBox(
                  width: 16,
                ),
                Text("New story",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "montserrat",
                        color: Color(0xff000000))),
              ],
            ),
            const SizedBox(height: 32),
            CategorySelector(context),
            const SizedBox(height: 32),
            StoryField(context),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => {
                BlocProvider.of<FireStoreCubit>(context).addStory(
                    currentUser!.uid,
                    postController.text,
                    currentUser.name,
                    selectedVlaue)
              },
              style: ElevatedButton.styleFrom(
                  side: BorderSide(
                      width: 1, color: Theme.of(context).primaryColorDark),
                  fixedSize: const Size(64, 36),
                  primary: Theme.of(context).primaryColorLight),
              child: const Text(
                "Post",
                style: TextStyle(
                    fontFamily: "montserrat",
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CategorySelector(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Theme.of(context).primaryColorLight,
              prefixIcon: Icon(
                FontAwesome5.bars,
                size: 20,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(
                    width: 1, color: Theme.of(context).primaryColorDark),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                borderSide: BorderSide(width: 1, color: Color(0xFF666666)),
              ),
            ),
            icon: const Icon(
              FontAwesome5.chevron_down,
              color: Colors.black,
              size: 10,
            ),
            value: selectedVlaue,
            items: categories
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: "montserrat"),
                      ),
                    ))
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedVlaue = value;
              });
            }),
      ),
    );
  }

  Widget StoryField(BuildContext context) {
    return Expanded(
      child: Container(
        child: TextField(
          controller: postController,
          expands: true,
          minLines: null,
          maxLines: null,
          textAlignVertical: TextAlignVertical.top,
          onSubmitted: ((value) {}),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            hintText: 'Write your story ...',
            hintStyle: TextStyle(
                fontFamily: "montserrat",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black),
            filled: true,
            fillColor: Theme.of(context).primaryColorLight,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(
                  width: 1, color: Theme.of(context).primaryColorDark),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              borderSide: BorderSide(width: 1, color: Color(0xFF666666)),
            ),
          ),
        ),
      ),
    );
  }
}
