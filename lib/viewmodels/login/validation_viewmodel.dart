import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/extensions/list_extentions.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/pages/home/main_screen.dart';
import 'package:rayaniyaresh/core/services/login/sms_service.dart' as service;

class ValidateViewModel extends GetxController {
  ValidateViewModel({required this.phoneNumber});
  final String phoneNumber;
  final GetStorage _storage = GetStorage();
  RxBool filled = false.obs;
  RxInt time = 120.obs;
  late Timer _timer;
  List inputCode = List.generate(4, (index) => "");
  List<RxInt> correctCode = List.generate(4, (index) => 2.obs);
  List<TextEditingController> textControllers =
      List.generate(4, (index) => TextEditingController());
  @override
  void onInit() async {
    await GetStorage.init();
    super.onInit();
    Get.closeAllSnackbars();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      time--;
      if (time.value == 0) timer.cancel();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  Future<void> sendSmsCode() async {
    // showMessage(message: "در حال ارسال کد");
    // var _request = await sendSms(phoneNumber);
    // if (_request.statusCode == 201) {
    //   time.value = 120;
    //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
    //     time--;
    //     if (time.value == 0) timer.cancel();
    //   });
    //   Get.closeAllSnackbars();
    //   showMessage(message: "کد ارسال شد", type: MessageType.success);
    // } else {
    //   print(_request.body);
    // }
  }

  Future<void> validateSmsCode() async {
    // showMessage(message: "در حال بررسی کد");
    // var _request =
    //     await service.checkSms(phoneNumber, inputCode.valueToString());
    // if (_request.statusCode == 200) {
    //   await _storage.write("token", _request.body['Token']);
    //   await _storage.write("id", _request.body['Id']);
    SingletonClass().imageUrl =
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200";
    // UserModel.fromJson(_request.body).imageUrl ?? "";
    Get.to(() => const MainScreen());
    // } else if (_request.statusCode == 400) {
    //   showMessage(message: "کد وارد شده صحیح نیست");
    // } else {
    //   networkErrorMessage();
    // }
  }
  // for (int i = 0; i < 4; i++) {
  //   correctCode[i].value = 1;
  //   await Future.delayed(const Duration(milliseconds: 200), () {});
  // }
  //
}
