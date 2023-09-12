import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_questions_screen.dart';

class NurseInformationViewmodel extends GetxController with StateMixin {
  final List<TextEditingController> textEditingController =
      List.generate(9, (index) => TextEditingController());

  final CreateNurseModel nurseModel = CreateNurseModel();

  List educationStrings = [
    "سیکل",
    "دیپلم",
    "فوق دیپلم",
    "لیسانس",
    "فوق لیسانس",
    // "دکترا",
  ];
  RxInt educationIndex = (0).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void validationForm() {
    nurseModel.education = educationStrings[educationIndex.value];
    if (validation()) {
      Get.to(() => NurseQuestionScreen(nurseModel: nurseModel),
          transition: Transition.leftToRight);
    }
  }

  bool validation() {
    if (nurseModel.name?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا نام را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.fatherName?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا نام پدر را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.birthday?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا تاریخ تولد را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.bornCity?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا محل صدور را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.nationalCode?.isEmpty ??
        true && (nurseModel.nationalCode?.length ?? 0) < 11) {
      showMessage(
          title: 'خطا',
          message: 'لطفا کد ملی را درست وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.nationalNumber?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا شماره شناسنامه را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.address?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا آدرس را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (nurseModel.phoneNumber?.isEmpty ?? true) {
      showMessage(
          title: 'خطا',
          message: 'لطفا شماره تلفن همراه را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    return true;
  }
}
