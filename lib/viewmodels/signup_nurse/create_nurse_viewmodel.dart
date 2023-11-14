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

  RxList<int> categorySelect = <int>[].obs;
  RxList<int> shiftSelect = <int>[].obs;
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
      if (p0.length < 4) {
        categorySelect.remove(3);
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
    String nurseCategory = "";
    for (var index in categorySelect) {
      nurseCategory += ',${NurseCategory.values[index]}';
    }

    String nurseShift = "";
    for (var index in shiftSelect) {
      nurseShift += ',${shift[index]}';
    }

    nurseModel.shift = nurseShift;
    nurseModel.nurseCategory = nurseCategory;
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

  void addShift(int index) {
    if (index == 4) {
      shiftSelect.value = [];
      List.generate(5, (index) => shiftSelect.add(index));
    } else {
      shiftSelect.add(index);
      if (shiftSelect.length > 3) {
        shiftSelect.value = [];
        List.generate(5, (index) => shiftSelect.add(index));
      }
    }
  }
}
