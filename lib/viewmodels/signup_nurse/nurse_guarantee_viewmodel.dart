import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/nurse_guarantee_model.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_family_service.dart'
    as service;
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_download_screen.dart';

class NurseGuaranteeViewModel extends GetxController with StateMixin {
  NurseGuaranteeViewModel({required this.nurseId});
  final String nurseId;
  final NurseGuaranteeModel model = NurseGuaranteeModel()
    ..nurseParentModels = List.generate(3, (index) => NurseParentModel());

  RxInt guaranteeIndex = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    model.nurseId = nurseId;
  }

  Future<void> sendData() async {
    if ((model.husbandPhoneNumber?.isNotEmpty ?? false) ||
        (model.childPhoneNumber?.isNotEmpty ?? false) ||
        (model.parentPhoneNumber?.isNotEmpty ?? false)) {
      final _reqeust = await service.updateNurseFamily(model);
      if (_reqeust.statusCode == 200) {
        Get.to(() => const NurseDownloadScreen());
      }
    } else {
      showMessage(
          title: "خطا",
          message: "باید حداقل یکی از شماره تلفن ها را وارد کنید",
          type: MessageType.warning);
      return;
    }
    model.guarantee = Guarantee.values[guaranteeIndex.value];

    //
  }
}
