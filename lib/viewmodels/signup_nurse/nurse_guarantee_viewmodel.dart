import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/models/models/nurse_guarantee_model.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_family_service.dart'
    as service;
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_download_screen.dart';

class NurseGuaranteeViewModel extends GetxController with StateMixin {
  NurseGuaranteeViewModel({required this.nurseModel,required this.nurseId});
  final CreateNurseModel nurseModel;
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
    model.guarantee = Guarantee.values[guaranteeIndex.value];
    if (validate()) {
      final _reqeust = await service.updateNurseFamily(model);
      if (_reqeust.statusCode == 200) {
        Get.to(() =>  NurseDownloadScreen(nurseModel: nurseModel,));
        // }
      } else {}
    }
  }
    bool validate() {
      if (model.nurseParentModels?.any((element) =>
              (element.information?.isEmpty ?? true) ||
              (element.phoneNumber?.isEmpty ?? true) ||
              (element.knowingTime?.isEmpty ?? true) ||
              (element.information?.isEmpty ?? true)) ??
          true) {
        showMessage(
            title: "خطا",
            message: "لطفا همه فیلد ها مربوط به معرف را وارد کنید",
            type: MessageType.warning);
        return false;
      }
      if ((model.husbandPhoneNumber?.isEmpty ?? true) ||
          (model.childPhoneNumber?.isEmpty ?? true) ||
          (model.parentPhoneNumber?.isEmpty ?? true)) {
        showMessage(
            title: "خطا",
            message: "باید حداقل یکی از شماره تلفن ها را وارد کنید",
            type: MessageType.warning);
        return false;
      }

      return true;
    }
  }

