import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/views/pages/home/main_screen.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';
import 'package:rayaniyaresh/core/services/login/sms_service.dart' as service;
import 'package:rayaniyaresh/core/services/user_service.dart' as user_service;

class GetPhoneViewModel extends GetxController with StateMixin {
  RxString phoneNumber = "".obs;
  RxBool isPhoneValida = false.obs;
  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read("token");
    await checkToken();
    phoneNumber.listen((value) {
      if (value.length == 11 && value.startsWith('09')) {
        isPhoneValida.value = true;
      }
    });
  }

  Future<void> checkToken() async {
    final _request = await user_service.checkToken(token);
    if (_request.statusCode == 200) {
      Get.offAll(() => const MainScreen());
    } else {
      change(null, status: RxStatus.success());
    }
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
