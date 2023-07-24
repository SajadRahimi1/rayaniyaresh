import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/models/models/nurse_guarantee_model.dart';

Future<Response<dynamic>> updateNurseFamily(NurseGuaranteeModel model) async {
  return await getConnect.put(nurseFamilyUrl, model.toJson());
}
