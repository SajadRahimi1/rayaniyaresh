import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';

class MainViewController extends GetxController {
  MainViewController({this.initPage = 0});
  final int initPage;
  late final PageController pageController;
  RxInt currentPage = 0.obs;
  RxString unreadedLength = "".obs;
  late final GlobalKey<ScaffoldState> globalKey;

  @override
  void onInit() {
    globalKey = GlobalKey<ScaffoldState>();
    super.onInit();
    Get.closeAllSnackbars();
    currentPage.value = initPage;
    pageController = PageController(initialPage: initPage);

    currentPage.listen((p0) {
      pageController.jumpToPage(p0);
    });

    unreadedLength.value = getUnreadedMessage;
  }

  @override
  void dispose() {
    super.dispose();
    globalKey.currentState?.dispose();
    pageController.dispose();
  }

  String get getUnreadedMessage {
    var length = SingletonClass()
            .userModel
            ?.messages
            ?.where((element) =>
                element.userId != null &&
                element.isUserSend == false &&
                element.seen == false)
            .toList()
            .length ??
        0;
    if (length > 9) return "+9";
    if (length == 0) return "";
    return length.toString();
  }
}
