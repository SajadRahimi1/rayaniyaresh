import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class NurseUploadsViewModel extends GetxController {
  NurseUploadsViewModel({required this.id});
  final String id;

  List<RxString> imagePaths = List.generate(4, (index) => "".obs);

  @override
  void onInit() {
    // TODO: implement onInit
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
}
