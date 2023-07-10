import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> checkToken(String token) async {
  return await getConnect.get(getUserUrl, headers: {"Authorization": token});
}

Future<Response<dynamic>> updateUser(Map user, String token) async {
  return await getConnect
      .put(updateUserUrl, user, headers: tokenHeader(token));
}
