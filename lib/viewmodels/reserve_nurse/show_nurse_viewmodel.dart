import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/reserve_nurse/show_nurse_service.dart';
import 'package:rayaniyaresh/models/models/nurse_model.dart';

class ShowNurseViewmodel extends GetxController with StateMixin {
  List<NurseModel> nurseModel = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getData();
  }

  Future<void> getData() async {
    final _request = await getNurses();
    if (_request.statusCode == 200) {
      nurseModel = List.generate(_request.body.length,
          (index) => NurseModel.fromJson(_request.body[index] ?? ""));
      change(null, status: RxStatus.success());
    } else {
      change(null, status: RxStatus.error());
    }
  }
}
