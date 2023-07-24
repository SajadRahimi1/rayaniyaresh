import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/create_nurse_service.dart'
    as service;
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_uploads_screen.dart';

class CreateNurrseViewModel extends GetxController with StateMixin {
  CreateNurrseViewModel(this.nurseModel);
  final CreateNurseModel nurseModel;

  RxInt categorySelect = (3).obs;
  RxBool secondQuestion = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> createNurse() async {
    nurseModel.nurseCategory = NurseCategory.values[categorySelect.value];
    nurseModel.specialCare = secondQuestion.value;
    // final _request = await service.createNurse(nurseModel);
    // if (_request.statusCode == 200) {
    // Get.to(() => NurseUploadsScreen(nurseId: _request.body['Id']),
    //     transition: Transition.leftToRight);
    Get.to(() => NurseUploadsScreen(nurseId: ""),
        transition: Transition.leftToRight);
    // } else {
    //   networkErrorMessage();
    // }
  }
}
