import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';

class GetPhoneViewModel extends GetxController with StateMixin {
  RxString phoneNumber = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> sendData() async {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2), () {
      change(null, status: RxStatus.success());
      Get.to(() => ValidateCodeScreen(
            phoneNumber: phoneNumber.value,
          ));
    });
  }
}
