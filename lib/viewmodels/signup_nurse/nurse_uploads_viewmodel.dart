import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/nurse_uploads_service.dart'
    as service;
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_guarantee_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class NurseUploadsViewModel extends GetxController {
  NurseUploadsViewModel({required this.id});
  final String id;

  List<RxString> imagePaths = List.generate(4, (index) => "".obs);

  Future<void> selectImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 40);
    if (image != null) {
      imagePaths[index].value = image.path;
    }
  }

  Future<void> uploadImages() async {
    if (isImagesNotNull()) {
      loading();
      final _request = await service.uploadImages(
          id,
          File(imagePaths[0].value),
          File(imagePaths[1].value),
          File(imagePaths[2].value),
          imagePaths[0].isEmpty ? null : File(imagePaths[0].value));
      Get.back();

      if (_request.statusCode == 200) {
        CreateNurseModel updatedImageNurse =
            CreateNurseModel.fromJson(_request.body);
        Get.to(() => NurseGuaranteeScreen(
              nurseid: id,
              nurseModel: updatedImageNurse,
            ));
      } else {
        networkErrorMessage();
      }
    } else {
      showMessage(
          title: 'خطا',
          message: 'همه عکس ها را باید انتخاب کنید',
          type: MessageType.error);
    }
  }

  bool isImagesNotNull() {
    if (imagePaths[0].value.isEmpty) return false;
    if (imagePaths[1].value.isEmpty) return false;
    if (imagePaths[2].value.isEmpty) return false;
    return true;
  }
}
