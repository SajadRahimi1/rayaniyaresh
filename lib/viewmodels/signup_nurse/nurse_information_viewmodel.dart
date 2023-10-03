import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_questions_screen.dart';

class NurseInformationViewmodel extends GetxController with StateMixin {
  final List<TextEditingController> textEditingController =
      List.generate(9, (index) => TextEditingController());
  final TextEditingController provinceController = TextEditingController(),
      cityController = TextEditingController();
  String neighbourhood = "",street='',alley='',plate='',number='';
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
    nurseModel.address =
        "استان ${provinceController.text} شهر ${cityController.text} محله $neighbourhood خیابان $street ${alley.isNotEmpty?'کوچه ' +alley:''} پلاک $plate واحد $number";
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
    if ((nurseModel.nationalCode?.isEmpty ?? true) ||
        (nurseModel.nationalCode?.length ?? 0) < 10) {
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
    if (provinceController.text.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا استان خود را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (cityController.text.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا شهر خود را وارد کنید',
          type: MessageType.warning);
      return false;
    }
    if (neighbourhood.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا محله خود را وارد کنید',
          type: MessageType.warning);
      return false;
    }
     if (street.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا نام خیابان خود را وارد کنید',
          type: MessageType.warning);
      return false;
    } if (plate.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا پلاک خود را وارد کنید',
          type: MessageType.warning);
      return false;
    } if (number.isEmpty) {
      showMessage(
          title: 'خطا',
          message: 'لطفا واحد خود را وارد کنید',
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
