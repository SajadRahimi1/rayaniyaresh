import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/pdf_service.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_uploads_service.dart'
    as service;
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_rules_screen.dart';

class NursePdfViewModel extends GetxController with StateMixin {
  NursePdfViewModel(this.nurseModel);
  CreateNurseModel nurseModel;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await upload();
  }

  Future<void> upload() async {
    var pdf = await PdfService().init(
      name: nurseModel.name ?? "",
      fatherName: nurseModel.fatherName ?? "",
      birthday: nurseModel.birthday ?? "",
      nn: nurseModel.nationalNumber ?? "",
      nn2: nurseModel.nationalCode ?? "",
      picture: nurseModel.picture ?? "",
      formCode: (nurseModel.formCode ?? 6000).toString(),
    );
    var request = await service.uploadPdfFile(
        pdf, nurseModel.id ?? "", (nurseModel.nationalCode ?? "") + '.pdf');
    print(request.body);
    if (request.statusCode == 200) {
      Get.off(() => NurseRulesScreen(
            model: nurseModel,
          ));
    }
  }
}
