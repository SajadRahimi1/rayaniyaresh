import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  HomeViewController({this.initPage = 2});
  final int initPage;
  late final PageController pageController;
  var currentPage = 2.obs;
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
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    globalKey.currentState?.dispose();
    pageController.dispose();
  }
}
