import 'dart:async';

import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';

class ValidateViewModel extends GetxController {
  ValidateViewModel({required this.phoneNumber});
  final String phoneNumber;
  RxBool filled = false.obs;
  RxInt time = 120.obs;
  late Timer _timer;
  List inputCode = List.generate(4, (index) => "");
  List<RxInt> correctCode = List.generate(4, (index) => 2.obs);
  List<TextEditingController> textControllers =
      List.generate(4, (index) => TextEditingController());
  @override
  void onInit() async {
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
    //   showMessage(message: "در حال بررسی کد");
    //   var _request = await checkCode(phoneNumber, inputCode.valueToString());
    //   if (_request.statusCode == 201 && _request.body['status'] == 200) {
    //     await _storage.write("token", _request.body['token']);
    //     await _storage.write("id", _request.body['data']['user']['_id']);
    //     if (_request.body['data']['user']['firstName'] == null) {
    //       Get.to(() => const GetNameScreen(),
    //                       transition: Transition.noTransition);
    //     } else {
    //       var name = NameClass();
    //       name.name = _request.body['data']['user']['firstName'] +
    //           " " +
    //           _request.body['data']['user']['lastName'];
    //       // await _storage.write(
    //       //     "name",
    //       //     _request.body['data']['user']['firstName'] +
    //       //         " " +
    //       //         _request.body['data']['user']['lastName']);
    //       Get.offAll(() => const HomeScreen());
    //     }
    //   } else if (_request.statusCode == 406) {
    //     showMessage(message: "کد وارد شده صحیح نیست");
    //   }
    // }
    for (int i = 0; i < 4; i++) {
      correctCode[i].value = 1;
      Future.delayed(const Duration(seconds: 2), () {});
    }
  }
}
