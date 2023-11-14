import 'dart:async';

import 'package:flutter/material.dart'
    show ScrollController, TextEditingController;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/support/chat_service.dart'
    as service;
import 'package:rayaniyaresh/models/models/message_model.dart';

class SupportViewModel extends GetxController with StateMixin {
  final GetStorage _getStorage = GetStorage();
  String token = "";
  RxList<MessageModel> messagesList = <MessageModel>[].obs;
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();

  Timer? timer;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    await getMessages();

    timer = Timer.periodic(
        const Duration(seconds: 10), (timer) async => getMessages());
  }

  @override
  void dispose() async {
    super.dispose();
    timer?.cancel();
  }

  Future<void> getMessages() async {
    final _request = await service.getMessages(token);
    if (_request.statusCode == 200) {
      messagesList.value =
          List.from(_request.body.map((x) => MessageModel.fromJson(x)));
      messagesList.value = messagesList.reversed.toList();
      change(null, status: RxStatus.success());
    } else {
      networkErrorMessage();
    }
  }

  Future<void> sendMessage(String message) async {
    var messageModel = MessageModel(
      content: message,
      isUserSend: true,
      messageType: "text",
      isSent: false,
      success: true,
    );
    messagesList.insert(0, messageModel);
    final _request = await service.sendMessage(token, message);
    int indexOfMessage = messagesList.indexOf(messageModel);
    if (_request.statusCode == 200) {
      messageModel = MessageModel.fromJson(_request.body);
      messagesList[indexOfMessage] = messageModel;
    } else {
      messagesList[indexOfMessage].isSent = true;
      messagesList[indexOfMessage].success = false;
      networkErrorMessage();
    }
  }

  Future<void> sendImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 15);
    if (image != null) {
      showMessage(message: 'در حال آپلود');
      final request = await service.sendFile(image.path, token);
      if (request.statusCode == 200) {
        await getMessages();
      } else {
        networkErrorMessage();
      }
    }
  }
}
