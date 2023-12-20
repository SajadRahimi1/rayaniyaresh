import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_uploads_screen.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/create_nurse_service.dart'
    as service;
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class CreateNurrseViewModel extends GetxController with StateMixin {
  CreateNurrseViewModel(this.nurseModel);
  final CreateNurseModel nurseModel;

  GetStorage getStorage = GetStorage();
  String token = "";

  RxList<NurseCategory> categorySelect = <NurseCategory>[].obs;
  RxList<Shift> shiftSelect = <Shift>[].obs;
  RxBool secondQuestion = false.obs;

  final List<String> shift = [
    "شبانه روزی",
    "روزانه",
    "شبانه",
    "مقطعی",
    "همه موارد"
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categorySelect.listen((p0) {
      if (p0.length > 2 && !p0.contains(NurseCategory.All)) {
        categorySelect.add(NurseCategory.All);
      }
    });
    token = getStorage.read('token');
  }

  Future<void> createNurse() async {
    if (categorySelect.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'باید حداقل یکی از دسته ها را انتخاب کنید',
          type: MessageType.warning);
      return;
    }
    loading();

    nurseModel.shifts = shiftSelect;
    nurseModel.nurseCategories = categorySelect;
    nurseModel.specialCare = secondQuestion.value;

    final _request = await service.createNurse(nurseModel, token);
    Get.back();
    if (_request.statusCode == 200) {
      Get.to(() => NurseUploadsScreen(nurseId: _request.body['Id']),
          transition: Transition.leftToRight);
    } else {
      networkErrorMessage();
    }
  }
}
