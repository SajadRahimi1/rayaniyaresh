import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/user_service.dart' as user_service;
import 'package:rayaniyaresh/core/services/reserve_class/class_service.dart'
    as class_service;
import 'package:rayaniyaresh/models/models/reserve_class_model.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InformationFormViewModel extends GetxController with StateMixin {
  InformationFormViewModel({required this.isReserving, this.reserveClassModel});
  final bool isReserving;
  final ReserveClassModel? reserveClassModel;

  final GetStorage _getStorage = GetStorage();
  List<TextEditingController> textEditingController =
      List.generate(9, (index) => TextEditingController());
  final TextEditingController birthdayController = TextEditingController();

  List educationStrings = [
    "سیکل",
    "دیپلم",
    "فوق دیپلم",
    "لیسانس",
    "فوق لیسانس",
    "دکترا",
  ];
  UserModel? userModel;
  RxInt education = (-1).obs;
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    await getData();
  }

  Future<void> getData() async {
    final _request = await user_service.checkToken(token);
    if (_request.statusCode == 200) {
      userModel = UserModel.fromJson(_request.body);
      change(null, status: RxStatus.success());
      fillText();
    } else {
      networkErrorMessage();
    }
  }

  void fillText() {
    textEditingController[0].text = userModel?.name ?? "";
    textEditingController[1].text = userModel?.fatherName ?? "";
    textEditingController[2].text = userModel?.birthday ?? "";
    textEditingController[3].text = userModel?.bornCity ?? "";
    textEditingController[4].text = userModel?.nationalCode ?? "";
    textEditingController[5].text = userModel?.nationalNumber ?? "";
    textEditingController[6].text = userModel?.address ?? "";
    textEditingController[7].text = userModel?.phoneNumber ?? "";
    textEditingController[8].text = userModel?.emergancyNumber ?? "";
    education.value = educationStrings.indexOf(userModel?.education);
  }

  Future<bool> updateInformation() async {
    if (isAllFilled()) {
      loading();
      education.value > -1
          ? userModel?.education = educationStrings[education.value]
          : {};
      print(userModel?.toJson());
      final _request =
          await user_service.updateUser(userModel?.toJson() ?? {}, token);
      Get.back();
      if (_request.statusCode == 200) {
        showMessage(
            message: "اطلاعات با موفقیت ویرایش شد",
            title: "ویرایش اطلاعات",
            type: MessageType.success);
      } else {}
      return true;
    }
    return false;
  }

  Future<void> reserveClass(bool? isInstallment) async {
    if (reserveClassModel != null && isInstallment != null) {
      final _request = await class_service.reserveClass(
          token: token,
          day: reserveClassModel?.day ?? "",
          hours: reserveClassModel?.hours ?? "",
          isInstallment: isInstallment,
          classCategoryId: reserveClassModel?.classCategoryId ?? "");
      Get.back();
      if (_request.statusCode == 200) {
        // Get.off(() => const SuccessReserveScreen());
        launchUrlString(_request.bodyString ?? "");
      }
    }
  }

  bool isAllFilled() {
    if (userModel?.name == null) {
      showMessage(
          title: "خطا",
          message: "لطفا نام را وارد کنبد",
          type: MessageType.warning);
      return false;
    }
    if (userModel?.fatherName == null) {
      showMessage(
          title: "خطا",
          message: "لطفا نام پدر را وارد کنبد",
          type: MessageType.warning);
      return false;
    }
    if (userModel?.birthday == null) {
      showMessage(
          title: "خطا",
          message: "لطفا تاریخ تولد را وارد کنبد",
          type: MessageType.warning);
      return false;
    }
    if (userModel?.nationalCode == null) {
      showMessage(
          title: "خطا",
          message: "لطفا کد ملی را وارد کنبد",
          type: MessageType.warning);
      return false;
    }
    return true;
  }
}
