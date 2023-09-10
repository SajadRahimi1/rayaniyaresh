import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';

Future<Response<dynamic>> createNurse(CreateNurseModel model) async {
  return await getConnect.post(nurseUrl, model.toJson());
}

Future<Response<dynamic>> finalize(String phoneNumber, String name) async {
  return await getConnect.get(nurseHiringSmsUrl,
      query: {'name': name, 'phoneNumber': phoneNumber});
}
