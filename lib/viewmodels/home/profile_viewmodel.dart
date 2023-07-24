import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/user_service.dart' as service;

class ProfileViewmodel extends GetxController with StateMixin {
  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
  }

  Future<void> updateImage() async {
    // final ImagePicker picker = ImagePicker();
    // final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   final _request =
    //       await service.updateImage(token, File(image.path), image.name);
    //   if (_request.statusCode == 200) {
    //   } else {
    //     networkErrorMessage();
    //   }
    // }
  }
}
