import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_uploads_service.dart'
    as service;
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_guarantee_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class NurseUploadsViewModel extends GetxController {
  NurseUploadsViewModel({required this.id});
  final String id;

  List<RxString> imagePaths = List.generate(4, (index) => "".obs);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> selectImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (image != null) {
      imagePaths[index].value = image.path;
    }
  }

  Future<void> uploadImages() async {
    // loading();
    // final _request = await service.uploadImages(
    //     id,
    //     File(imagePaths[0].value),
    //     File(imagePaths[1].value),
    //     File(imagePaths[2].value),
    //     imagePaths[0].isEmpty ? null : File(imagePaths[0].value));
    // Get.back();

    // if (_request.statusCode == 200) {
    Get.to(() => NurseGuaranteeScreen(
          nurseid: id,
        ));
    // } else {
    //   networkErrorMessage();
    // }
  }
}
