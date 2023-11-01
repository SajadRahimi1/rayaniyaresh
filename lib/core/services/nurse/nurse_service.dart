import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> getNurse(String token) async {
  return await getConnect.get(getNursesUrl, headers: tokenHeader(token));
}

Future<Response<dynamic>> getSingleNurse(String token, String id) async {
  return await getConnect.get(getSingleNurseUrl,
      query: {'nurseId': id}, headers: tokenHeader(token));
}
