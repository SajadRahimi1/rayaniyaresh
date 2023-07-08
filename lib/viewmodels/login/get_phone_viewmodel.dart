import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';
import 'package:rayaniyaresh/core/services/login/sms_service.dart' as service;

class GetPhoneViewModel extends GetxController with StateMixin {
  RxString phoneNumber = "".obs;
  RxBool isPhoneValida = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.success());
    phoneNumber.listen((value) {
      if (value.length == 11 && value.startsWith('09')) {
        isPhoneValida.value = true;
      }
    });
  }

  Future<void> sendData() async {
    if (isPhoneValida.value) {
      loading();
      final _request = await service.sendSms(phoneNumber.value);
      if (_request.statusCode == 200) {
        Get.back();
        Get.to(() => ValidateCodeScreen(
              phoneNumber: phoneNumber.value,
            ));
      } else {
        Get.back();
        networkErrorMessage();
      }
    } else {
      showMessage(
          title: "خطا",
          message: "لطفا شماره تلفن را درست وارد کنید",
          type: MessageType.warning);
    }
  }
}
