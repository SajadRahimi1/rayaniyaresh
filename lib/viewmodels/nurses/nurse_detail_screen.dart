import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/nurse/nurse_service.dart';
import 'package:rayaniyaresh/core/services/nurse/payment_service.dart'
    as payment_service;
import 'package:rayaniyaresh/models/models/nurse_information_model.dart';

class NurseDetailViewModel extends GetxController with StateMixin {
  NurseDetailViewModel(this.id);
  final String id;

  String message = "", token = "";
  final GetStorage getStorage = GetStorage();

  NurseInformationModel? model;
  RxString isPaid = "".obs;
  RxString paidStatus = "درحال بررسی".obs;

  RxBool showEditIcon = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = getStorage.read('token');
    await getData();
  }

  Future<void> getData() async {
    final request = await getSingleNurse(token, id);
    if (request.statusCode == 200) {
      model = NurseInformationModel.fromJson(request.body);
      isPaid.value = model?.authority ?? "";
      change(null, status: RxStatus.success());
      await checkPayment();
    } else {
      change(null, status: RxStatus.error(request.body));
    }
  }

  Future<void> checkPayment() async {
    if (model?.authority?.contains('A00') ?? false) {
      final request = await payment_service.checkPayment(
          model?.authority ?? '', model?.id ?? '');
      if (request.statusCode == 200) {
        if (request.body['data']['code'].toString() == "100" ||
            request.body['data']['code'].toString() == "101") {
          isPaid.value = 'ok';
        } else {
          isPaid.value = "nok";
        }
      } else {
        isPaid.value = "nok";
      }
    }
    fillPaid();
  }

  void fillPaid() {
    if (isPaid.value == "ok") {
      paidStatus.value = "پرداخت شده";
      return;
    }
    paidStatus.value = "پرداخت نشده";
  }

  String getGuarantee() {
    if (model?.guarantee != null) {
      switch (model?.guarantee) {
        case 0:
          return 'سفته';
        case 1:
          return 'چک';
        case 2:
          return 'مدرک';
        case 3:
          return 'معرف';
      }
    }
    return "نامشخص";
  }

  Future<void> updateNurse() async {
    // final request = await service.updateNurse(model?.toJson() ?? {});
    // if (request.statusCode == 200) {
    //   showMessage(message: 'با موفقیت اپدیت شد', type: MessageType.success);
    // } else {
    //   print(request.body);
    // }
  }
}
