import 'dart:async';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/pages/messages/messages_screen.dart';

class HomeViewModel extends GetxController {
  RxInt messagesLength = 0.obs;
  Rx<int> color = 0.obs;
  Timer? colorChanger;

  List<Message> messages = [];
  List<Message> baseMessages = [];

  UserModel? userModel;
  List readMessages = [];

  final GetStorage getStorage = GetStorage();

  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    readMessages = getStorage.read('read').toString().split(',');
    userModel = SingletonClass().userModel;
    getData();
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
      messagesLength.value = messages.length;
      if (messages.isNotEmpty) {
        colorChanger =
            Timer.periodic(const Duration(milliseconds: 500), (timer) {
          if (color.value == 0) {
            color.value = 1;
          } else {
            color.value = 0;
          }
        });
      }
    }
  }

  void onMessagesClick() {
    if (messages.isNotEmpty) {
      var messagesString = "";
      for (var ms in messages) {
        messagesString += ms.id.toString() + ',';
      }
      colorChanger?.cancel();
      print(messagesString.substring(0, messagesString.length - 1));
      getStorage.write(
          'read', messagesString.substring(0, messagesString.length - 1));
      messagesLength.value = 0;
    }
    Get.to(() => MessagesScreen(messages: baseMessages));
  }
}
