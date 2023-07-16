import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_class/class_service.dart'
    as class_service;
import 'package:rayaniyaresh/models/models/class_model.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_subcategory_screen.dart';
import 'package:rayaniyaresh/views/widgets/loading_widget.dart';

class MoreViewModel extends GetxController with StateMixin {

  Future<void> gotoSubcategory(String title, String appBarTitle) async {
    loading();
    final _request = await class_service.getSingleClass(title);
    Get.back();
    if (_request.statusCode == 200) {
      var model = List<ClassCategories>.from(
          _request.body.map((x) => ClassCategories.fromJson(x)));
      Get.to(() => ClassSubcategoryScreen(title: appBarTitle, model: model));
    } else {
      networkErrorMessage();
    }
  }
}
