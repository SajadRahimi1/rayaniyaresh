import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';

Future<Response<dynamic>> createNurse(CreateNurseModel model,String token) async {
  return await getConnect.post(nurseUrl, model.toJson(),headers: tokenHeader(token));
}

Future<Response<dynamic>> acceptRules(String id) async {
  return await getConnect
      .get(nurseRulesUrl, query: {'id': id}, headers: {'accept': '*/*'});
}
