import 'dart:io';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/user_service.dart' as service;
import 'package:rayaniyaresh/models/constants/singleton_class.dart';

class ProfileViewmodel extends GetxController with StateMixin {
  final GetStorage _getStorage = GetStorage();
  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    change(null, status: RxStatus.success());
  }

  Future<void> updateImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      change(null, status: RxStatus.loading());
      final _request =
          await service.updateImage(token, File(image.path), image.name);
      if (_request.statusCode == 200) {
        SingletonClass().imageUrl = _request.body['ImageUrl'];
        change(null, status: RxStatus.success());
        showMessage(
            message: 'عکس ا موفقیت اپلود شد', type: MessageType.success);
      } else {
        change(null, status: RxStatus.success());

        networkErrorMessage();
      }
    }
  }
}
