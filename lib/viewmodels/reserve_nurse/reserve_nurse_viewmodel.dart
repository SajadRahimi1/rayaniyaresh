import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_nurse/reserve_nurse_service.dart'
    as service;

class ReserveNurseViewModel extends GetxController {
  ReserveNurseViewModel({required this.nurseId});
  final String nurseId;

  final GetStorage _getStorage = GetStorage();
  String token = "";

  RxList<bool> daysSelected = List.generate(7, (index) => false).obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
  }

  Future<void> reserveNurse() async {
    String days = convertDaysSelected();
    print(days);
    final _request = await service.reserveNurses(null, nurseId, days, token);
    if (_request.statusCode == 200) {
      Get.back();
      showMessage(
          message: "رزرو پرستار با موفقیت انجام شد",
          title: "رزرو پرستار",
          type: MessageType.success);
    } else {
      networkErrorMessage();
    }
  }

  String convertDaysSelected() {
    String output = "";
    List _days = [
      "شنبه",
      "یکشنبه",
      "دوشنبه",
      "سه شنبه",
      "چهارشنبه",
      "پنجشنبه",
      "جمعه",
    ];
    for (int i = 0; i < daysSelected.length; i++) {
      if (daysSelected[i]) {
        if (output.isEmpty) {
          output = _days[i];
        } else {
          output += "," + _days[i];
        }
      }
    }
    return output;
  }
}
