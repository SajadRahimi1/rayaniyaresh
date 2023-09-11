import 'package:get/get.dart';
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

  RxList<int> categorySelect = <int>[].obs;
  RxBool secondQuestion = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    categorySelect.listen((p0) {
      if (p0.length < 4) {
        categorySelect.remove(3);
      }
    });
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
    String nurseCategory = "";
    for (var index in categorySelect) {
      nurseCategory += ',${NurseCategory.values[index]}';
    }
    nurseModel.nurseCategory = nurseCategory;
    nurseModel.specialCare = secondQuestion.value;

    final _request = await service.createNurse(nurseModel);
    Get.back();
    if (_request.statusCode == 200) {
      Get.to(() => NurseUploadsScreen(nurseId: _request.body['Id']),
          transition: Transition.leftToRight);
    } else {
      networkErrorMessage();
    }
  }

  void addCategory(int index) {
    if (index == 3) {
      categorySelect.value = [];
      List.generate(4, (index) => categorySelect.add(index));
    } else {
      categorySelect.add(index);
      if (categorySelect.length > 2) {
        categorySelect.value = [];
        List.generate(4, (index) => categorySelect.add(index));
      }
    }
  }
}
