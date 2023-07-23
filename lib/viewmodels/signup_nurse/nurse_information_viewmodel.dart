import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
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
    "دکترا",
  ];
  RxInt education = (-1).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void validationForm() {
    Get.to(() => NurseQuestionScreen(nurseModel: nurseModel),
        transition: Transition.leftToRight);
  }
}
