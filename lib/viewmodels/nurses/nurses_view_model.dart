import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/nurse/nurse_service.dart' as service;
import 'package:rayaniyaresh/models/models/get_nurse_model.dart';

class NursesViewModel extends GetxController with StateMixin {
  List<GetNurseModel> nursesModel = [];

  final GetStorage getStorage = GetStorage();
  String token = "";
  @override
  void onInit() async {
    super.onInit();
    await GetStorage.init();
    token = getStorage.read('token');
    await getData();
  }

  Future<void> getData() async {
    final request = await service.getNurse(token);
    if (request.statusCode == 200) {
      nursesModel = List<GetNurseModel>.from(
          request.body.map((x) => GetNurseModel.fromJson(x)));
      nursesModel = nursesModel.reversed.toList();
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error(request.bodyString));
    }
  }
}
