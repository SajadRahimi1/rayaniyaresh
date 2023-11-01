import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/nurse/nurse_service.dart' as service;
import 'package:rayaniyaresh/core/services/nurse/payment_service.dart'
    as payment_service;
import 'package:rayaniyaresh/models/models/nurse_guarantee_model.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_family_service.dart'
    as family_service;
import 'package:rayaniyaresh/models/models/nurse_information_model.dart';

class NurseDetailViewModel extends GetxController with StateMixin {
  NurseDetailViewModel(this.id);
  final String id;

  String message = "", token = "";
  final GetStorage getStorage = GetStorage();

  NurseInformationModel? model;
  NurseGuaranteeModel nurseGuaranteeModel = NurseGuaranteeModel();
  RxBool isPaid = false.obs;
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
    final request = await service.getSingleNurse(token, id);
    if (request.statusCode == 200) {
      model = NurseInformationModel.fromJson(request.body);
      fillModel();
      // isPaid.value = model?.authority ?? "";
      change(null, status: RxStatus.success());
      await checkPayment();
    } else {
      change(null, status: RxStatus.error(request.body));
    }
  }

  Future<void> checkPayment() async {
    if (model?.authority?.contains('A00') ?? false) {
      final request = await payment_service.checkPayment(model?.id ?? '');
      if (request.statusCode == 200) {
        if (request.body['data']['code'].toString() == "100" ||
            request.body['data']['code'].toString() == "101") {
          isPaid.value = true;
        } else {
          isPaid.value = false;
        }
      } else {
        isPaid.value = false;
      }
    }
    fillPaid();
  }

  void fillPaid() {
    if (isPaid.value == true) {
      paidStatus.value = "پرداخت شده";
    } else {
      paidStatus.value = "پرداخت نشده";
    }
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
    fillModel();
    final request = await service.updateNurse(model?.toJson() ?? {}, token);
    if (request.statusCode == 200) {
      var request2 =
          await family_service.updateNurseFamily(nurseGuaranteeModel);
      showMessage(message: 'با موفقیت اپدیت شد', type: MessageType.success);
    } else {
      print(request.body);
    }
  }

  void fillModel() {
    nurseGuaranteeModel.nurseParentModels = [];
    int i = 0;
    while (i < 3) {
      nurseGuaranteeModel.nurseParentModels?.add(NurseParentModel()
        ..name = model?.nurseFamily?[i].name
        ..knowingTime = model?.nurseFamily?[i].knowTime
        ..information = model?.nurseFamily?[i].information
        ..phoneNumber = model?.nurseFamily?[i].phoneNumber);
      i++;
    }
    nurseGuaranteeModel.childPhoneNumber = model?.childPhoneNumber;
    nurseGuaranteeModel.husbandPhoneNumber = model?.homeNumber;
    nurseGuaranteeModel.parentPhoneNumber = model?.parentPhoneNumber;
    nurseGuaranteeModel.nurseId = model?.id;
  }
}
