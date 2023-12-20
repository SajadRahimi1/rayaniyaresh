import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/reserve_nurse/reserve_nurse_service.dart'
    as nurse_service;
import 'package:rayaniyaresh/core/services/user_service.dart' as user_service;
import 'package:rayaniyaresh/models/models/reserve_nurse_model.dart';
import 'package:rayaniyaresh/models/models/reserved_model.dart';

class ReservedListViewmodel extends GetxController with StateMixin {
  RxInt pageIndex = 0.obs;
  final GetStorage _getStorage = GetStorage();
  List<ReserveNurseModel> nurseModels = [];
  ReservedModel? reservedModel;

  String token = "";

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await GetStorage.init();
    token = _getStorage.read('token');
    await getReserved();
  }

  Future<void> getNursesReserved() async {
    final _request = await nurse_service.getReserveNurses(token);
    if (_request.statusCode == 200) {
      nurseModels =
          List.from(_request.body.map((x) => ReserveNurseModel.fromJson(x)));
      change(null, status: RxStatus.success());
    } else {
      networkErrorMessage();
    }
  }

  Future<void> getReserved() async {
    final _request = await user_service.getReserved(token);
    if (_request.statusCode == 200) {
      reservedModel = ReservedModel.fromJson(_request.body);
      change(null, status: RxStatus.success());
    } else {
      networkErrorMessage();
    }
  }
}
