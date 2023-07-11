import 'package:flutter/material.dart' show ScrollController;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/support/chat_service.dart'
    as service;
import 'package:rayaniyaresh/models/models/message_model.dart';

class SupportViewModel extends GetxController with StateMixin {
  final GetStorage _getStorage = GetStorage();
  String token = "";
  List<MessageModel> messagesList = [];
    final ScrollController scrollController = ScrollController();


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    await getMessages();
  }

  Future<void> getMessages() async {
    final _request = await service.getMessages(token);
    if (_request.statusCode == 200) {
      messagesList =
          List.from(_request.body.map((x) => MessageModel.fromJson(x)));
      change(null, status: RxStatus.success());
    } else {
      networkErrorMessage();
    }
  }
}
