import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/pages/home/main_screen.dart';
import 'package:rayaniyaresh/views/pages/login/validation_screen.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';
import 'package:rayaniyaresh/core/services/login/sms_service.dart' as service;
import 'package:rayaniyaresh/core/services/user_service.dart' as user_service;
import 'package:uni_links/uni_links.dart';

class GetPhoneViewModel extends GetxController with StateMixin {
  GetPhoneViewModel(this.isExit);
  final bool isExit;
  RxString phoneNumber = "".obs;
  RxBool isPhoneValida = false.obs;
  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read("token") ?? "";
    // token = "";
    if (isExit) {
      change(null, status: RxStatus.success());
    } else {
      await checkToken();
    }

    phoneNumber.listen((value) {
      if (value.length == 11 && value.startsWith('09')) {
        isPhoneValida.value = true;
      }
    });
  }

  Future<void> checkToken() async {
    print(token);
    if (token.isNotEmpty) {
      final _request = await user_service.checkToken(token);
      if (_request.statusCode == 200) {
        SingletonClass _singletonClass = SingletonClass();
        UserModel _userModel = UserModel.fromJson(_request.body);
        _singletonClass
          ..imageUrl = _userModel.imageUrl
          ..name = _userModel.name
          ..phoneNumber = _userModel.phoneNumber;
        String? link = await getInitialLink();
        if (link != null) {
          print(link.split('Status='));
          if (link.split('Status=').last == 'OK') {
            Get.offAll(() => const SuccessReserveScreen());
          } else {
            Get.offAll(() => const SuccessReserveScreen(
                  message: 'پرداخت شما موفقیت آمیز نبود',
                ));
          }
        } else {
          Get.offAll(() => const MainScreen());
        }
      } else {
        change(null, status: RxStatus.success());
      }
    } else {
      change(null, status: RxStatus.success());
    }
  }

  Future<void> sendData() async {
    if (isPhoneValida.value) {
      loading();
      final _request = await service.sendSms(phoneNumber.value);
      // if (_request.statusCode == 200) {
      Get.back();
      Get.to(() => ValidateCodeScreen(
            phoneNumber: phoneNumber.value,
          ));
      // } else {
      //   Get.back();
      //   networkErrorMessage();
      // }
    } else {
      showMessage(
          title: "خطا",
          message: "لطفا شماره تلفن را درست وارد کنید",
          type: MessageType.warning);
    }
  }
}
