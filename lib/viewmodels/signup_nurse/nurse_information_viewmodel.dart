import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';

class NurseInformationViewmodel extends GetxController with StateMixin {
  final List<TextEditingController> textEditingController =
      List.generate(9, (index) => TextEditingController());

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
}
