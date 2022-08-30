import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  dynamic cardMaxLine = 8;
  var textOverflow = TextOverflow.ellipsis;
  String info = "See the full story ...";
  bool hide = false;

  showMore(tag) {
    if (!hide) {
      info = "See the full story ...";
      cardMaxLine = 8;
      textOverflow = TextOverflow.ellipsis;
      hide = !hide;
    } else {
      info = "Hide";
      cardMaxLine = null;
      textOverflow = TextOverflow.visible;
      hide = !hide;
    }
    update([tag]);
  }

  showLess() {
    update();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
