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
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

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

  Future<void> validateSmsCode() async {
    showMessage(message: "در حال بررسی کد");
    var _request =
        await service.checkSms(phoneNumber, inputCode.valueToString());
    if (_request.statusCode == 200) {
      await _storage.write("token", _request.body['Token']);
      await _storage.write("id", _request.body['Id']);
      SingletonClass _singletonClass = SingletonClass();
      UserModel _userModel = UserModel.fromJson(_request.body);
      _singletonClass
        ..imageUrl = _userModel.imageUrl
        ..name = _userModel.name
        ..phoneNumber = _userModel.phoneNumber;
      Get.to(() => const MainScreen());
    } else if (_request.statusCode == 400) {
      showMessage(message: "کد وارد شده صحیح نیست");
    } else {
      networkErrorMessage();
    }
  }

  Future<void> sendSmsCode() async {
    loading();
    await service.sendSms(phoneNumber);
    // if (_request.statusCode == 200) {
    Get.back();
    showMessage(message: 'کد با موفقیت ارسال شد', type: MessageType.success);
  }
}
