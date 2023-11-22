import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/pages/messages/messages_screen.dart';

class MainViewController extends GetxController {
  MainViewController({this.initPage = 0});
  RxBool hasNewMessage = false.obs;
  final int initPage;
  late final PageController pageController;
  RxInt currentPage = 0.obs;
  RxString unreadedLength = "".obs;
  late final GlobalKey<ScaffoldState> globalKey;

  List<Message> messages = [];
  List<Message> baseMessages = [];

  UserModel? userModel;
  List readMessages = [];
  final GetStorage getStorage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    pageController = PageController(initialPage: initPage);
    globalKey = GlobalKey<ScaffoldState>();
    await GetStorage.init();
    Get.closeAllSnackbars();
    currentPage.value = initPage;

    currentPage.listen((p0) {
      pageController.jumpToPage(p0);
    });

    userModel = SingletonClass().userModel;
    getData();
  }

  @override
  void dispose() {
    super.dispose();
    globalKey.currentState?.dispose();
    pageController.dispose();
  }

  void getData() {
    if (userModel != null) {
      baseMessages = (userModel?.messages
              ?.where((element) => element.userId == null)
              .toList()) ??
          <Message>[];
      for (var ms in userModel?.messages ?? <Message>[]) {
        if (!readMessages.contains(ms.id) && ms.userId == null) {
          messages.add(ms);
        }
      }
      hasNewMessage.value = messages.isNotEmpty;
    }
  }

  void onMessagesClick() {
    if (messages.isNotEmpty) {
      var messagesString = "";
      for (var ms in messages) {
        messagesString += ms.id.toString() + ',';
      }
      getStorage.write(
          'read', messagesString.substring(0, messagesString.length - 1));
      hasNewMessage.value = false;
    }
    Get.to(() => MessagesScreen(messages: baseMessages));
  }
}
