import 'package:flutter/material.dart' show TextEditingController;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/user_service.dart' as user_service;
import 'package:rayaniyaresh/models/models/user_model.dart';

class InformationFormViewModel extends GetxController with StateMixin {
  final GetStorage _getStorage = GetStorage();
  List<TextEditingController> textEditingController =
      List.generate(9, (index) => TextEditingController());

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
      fillText();
      change(null, status: RxStatus.success());
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
  }

  Future<void> updateInformation() async {}
}
