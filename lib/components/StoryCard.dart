import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:hkili/BL/cubit/auth_cubit.dart';
import 'package:hkili/BL/cubit/fire_store_cubit.dart';
import 'package:hkili/components/UserAvatar.dart';
import 'package:hkili/data/models/Story.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({Key? key, required this.story}) : super(key: key);

  final Story story;

  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  bool showHide = false;
  bool clicked = false;

  _showHide() {
    print("gtrgerg");
    setState(() {
      showHide = !showHide;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
    return Container(
      padding: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 20,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColorDark, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    /* IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: const Icon(
                          FontAwesome5.user,
                          color: Colors.white,
                          size: 24,
                        ),
                        foregroundImage: const NetworkImage(
                            "https://ichef.bbci.co.uk/news/976/cpsprodpb/14B1D/production/_125556748_gettyimages-1240422158.jpg"),
                      ),
                    ),*/
                    UserAvatar(userPhoto: widget.story.userPhoto),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(widget.story.userName!,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "montserrat",
                            color: Color(0xff000000)))
                  ],
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.sort_rounded,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    widget.story.category!,
                    style: TextStyle(fontSize: 14, fontFamily: "montserrat"),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            width: double.infinity,
            child: Text(
              "We bought an old house, my boyfriend and I. He's in charge of the construction – converting the kitchen in to the master bedroom for instance, while I'm on wallpaper removal duty. The previous ownerpapered EVERY wall and CEILING! Removing it is brutal, but oddly satisfying. The best feeling is getting a long peel, similar to your skin when you're peeling from a sunburn. I don't know about you but I kinda make a game of peeling, on the hunt for the longest piece before it rips. Under a corner section of paper in every room is a person’s name and a date.Curiosity got the best of me one night when I Googled one of the names and discovered the person was actually a missing person, the missing date matching the date under the wallpaper! The next day, I made a list of all the names and dates. Sure enough each name was for a missing person with dates to match. We notified the police who naturally sent out the crime scene team....",
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w300,
                fontFamily: "montserrat",
                color: const Color(0xff000000),
              ),
              maxLines: showHide ? 30 : 8,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                border: showHide
                    ? Border(top: BorderSide(width: 1, color: Colors.black))
                    : null),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(FontAwesome5.arrow_alt_circle_up),
                      onPressed: () {
                        if (widget.story.likes!
                            .contains(authCubit.currentUser()!.uid)) {
                          widget.story.likes!
                              .remove(authCubit.currentUser()!.uid);
                          BlocProvider.of<FireStoreCubit>(context)
                              .updateStory(widget.story);
                        } else if (widget.story.dislikes!
                            .contains(authCubit.currentUser()!.uid)) {
                          widget.story.dislikes!
                              .remove(authCubit.currentUser()!.uid);
                          widget.story.likes!.add(authCubit.currentUser()!.uid);
                          BlocProvider.of<FireStoreCubit>(context)
                              .updateStory(widget.story);
                        } else {
                          BlocProvider.of<FireStoreCubit>(context).like(
                              widget.story.storyId,
                              authCubit.currentUser()!.uid);
                        }
                      },
                      iconSize: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(widget.story.likes?.length.toString() ?? '0',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "montserrat",
                            color: Color(0xff000000))),
                    SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(),
                      icon: Icon(FontAwesome5.arrow_alt_circle_down),
                      onPressed: () {
                        if (widget.story.dislikes!
                            .contains(authCubit.currentUser()!.uid)) {
                          widget.story.dislikes!
                              .remove(authCubit.currentUser()!.uid);
                          BlocProvider.of<FireStoreCubit>(context)
                              .updateStory(widget.story);
                        } else if (widget.story.likes!
                            .contains(authCubit.currentUser()!.uid)) {
                          widget.story.likes!
                              .remove(authCubit.currentUser()!.uid);
                          widget.story.dislikes!
                              .add(authCubit.currentUser()!.uid);
                          BlocProvider.of<FireStoreCubit>(context)
                              .updateStory(widget.story);
                        } else {
                          BlocProvider.of<FireStoreCubit>(context).like(
                              widget.story.storyId,
                              authCubit.currentUser()!.uid);
                        }
                      },
                      iconSize: 20,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(widget.story.dislikes?.length.toString() ?? '0',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "montserrat",
                            color: Color(0xff000000))),
                  ],
                ),
                TextButton(
                  onPressed: () => {_showHide()},
                  child: Text(
                    showHide
                        ? 'Hide the full story ...'
                        : "See the full story ...",
                    style: TextStyle(
                        fontFamily: "monteserrat",
                        fontSize: 14,
                        color: Color(0xff000000),
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
