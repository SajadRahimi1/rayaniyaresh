import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class GetPhoneViewModel extends GetxController with StateMixin {
  RxString phoneNumber = "".obs;
  RxBool isPhoneValida = true.obs;

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
      Future.delayed(const Duration(seconds: 1), () {
        Get.back();
        Get.to(() => ValidateCodeScreen(
              phoneNumber: phoneNumber.value,
            ));
      });
    } else {
      showMessage(
          title: "خطا",
          message: "لطفا شماره تلفن را درست وارد کنید",
          type: MessageType.warning);
    }
  }
}
