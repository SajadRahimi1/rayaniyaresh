import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_class/class_service.dart'
    as service;
import 'package:rayaniyaresh/models/models/class_model.dart';

class ClassCategoryViewModel extends GetxController with StateMixin {
  List<ClassModel> classModel = [];
  @override
  void onInit() async {
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    final _request = await service.getAllClasses();
    if (_request.statusCode == 200) {
      classModel = List<ClassModel>.from(
          _request.body.map((x) => ClassModel.fromJson(x)));          
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
      networkErrorMessage();
    }
  }
}
