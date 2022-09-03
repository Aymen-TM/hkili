import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class StoryCard extends StatelessWidget {
  StoryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColorDark, width: 1),
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColorLight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: CircleAvatar(
                      backgroundColor: Theme.of(context).primaryColorLight,
                      child: const Icon(
                        FontAwesome5.user,
                        color: Colors.white,
                      ),
                      foregroundImage: const NetworkImage(
                          "https://ichef.bbci.co.uk/news/976/cpsprodpb/14B1D/production/_125556748_gettyimages-1240422158.jpg"),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text("user90",
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "montserrat",
                          color: Color(0xff000000)))
                ],
              ),
              Row(
                children: const [
                  Icon(
                    FontAwesome5.bars,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Horror",
                    style: TextStyle(fontSize: 14),
                  )
                ],
              ),
            ],
          ),
          Text(
            "We bought an old house, my boyfriend and I. He's in charge of the new construction – converting the kitchen in to the master bedroom for instance, while I'm on wallpaper removal duty. The previous ownerpapered EVERY wall and CEILING! Removing it is brutal, but oddly satisfying. The best feeling is getting a long peel, similar to your skin when you're peeling from a sunburn. I don't know about you but I kinda make a game of peeling, on the hunt for the longest piece before it rips. Under a corner section of paper in every room is a person’s name and a date Curiosi y got the best of me one night when I Googled one of the names and discovered the person was actually a missing person, the missing date matching the date under the wallpaper! The next day, I made a list of all the names and dates. Sure enough each name was for a missing person with dates to match. We notified the police who naturally sent out the crime scene team ",
            style: const TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontFamily: "montserrat",
              color: const Color(0xff000000),
            ),
            maxLines: 8,
            overflow: TextOverflow.ellipsis,
          ),
          true
              ? Divider(
                  color: Theme.of(context).primaryColorDark,
                  thickness: 1,
                )
              : const SizedBox(
                  height: 18,
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(
                    FontAwesome5.arrow_circle_up,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("25",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "montserrat",
                          color: Color(0xff000000))),
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    FontAwesome5.arrow_circle_up,
                    size: 20,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text("25",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: "montserrat",
                          color: Color(0xff000000))),
                ],
              ),
              TextButton(
                onPressed: () => {},
                child: Text(
                  "test",
                  style: const TextStyle(
                      fontFamily: "monteserrat",
                      fontSize: 14,
                      color: Color(0xff000000),
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
