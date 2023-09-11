import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_nurse/request_nurse_service.dart'
    as service;
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class RequestNurseViewmodel extends GetxController with StateMixin {
  RequestNurseViewmodel({required this.model});
  final RequestNurseModel model;

  final SingletonClass singletonClass = SingletonClass();

  final List<TextEditingController> textEditingControllers =
      List.generate(2, (index) => TextEditingController());

  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    textEditingControllers[0].text = singletonClass.name ?? "";
    textEditingControllers[1].text = singletonClass.phoneNumber ?? "";
  }

  Future<void> sendData() async {
    if (textEditingControllers[0].text.isNotEmpty) {
      loading();
      model.name = textEditingControllers[0].text;
      model.phoneNumber = textEditingControllers[1].text;
      final _request = await service.requestNurses(model, token);
      Get.back();
      if (_request.statusCode == 200) {
        Get.to(
            () => const SuccessReserveScreen(
                  message:
                      "کارشناسان ما در کمتر از 30 دقیقه آینده با شما جهت ارائه توضیحات بیشتر تماس میگیرند",
                ),
            transition: Transition.leftToRight);
      } else {
        networkErrorMessage();
      }
    } else {
      showMessage(
          title: 'خطا',
          message: 'باید نام را وارد کنید',
          type: MessageType.warning);
    }
  }
}
