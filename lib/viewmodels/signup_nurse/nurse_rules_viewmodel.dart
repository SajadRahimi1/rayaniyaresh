import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/create_nurse_service.dart'
    as service;
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NurseRulesViewModel extends GetxController {
  NurseRulesViewModel(this.id);
  final String id;

  RxBool accept = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> sendData() async {
    final request = await service.acceptRules(id);
    if (request.statusCode == 200) {
      launchUrlString(request.bodyString ?? "",
          mode: LaunchMode.externalApplication);
      Future.delayed(
          const Duration(seconds: 3),
          () => Get.to(() => SuccessReserveScreen(
                message:
                    "پس از تایید نهایی کارشناسان ما طی 24 ساعت با شما در تماس خواهند بود"
                        .toPersianDigit(),
              )));
    } else {
      networkErrorMessage();
    }
  }
}
