import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class GetPhoneViewModel extends GetxController with StateMixin {
  RxString phoneNumber = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    change(null, status: RxStatus.success());
  }

  Future<void> sendData() async {
    
    loading();
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
      Get.to(() => ValidateCodeScreen(
            phoneNumber: phoneNumber.value,
          ));
    });
  }
}
