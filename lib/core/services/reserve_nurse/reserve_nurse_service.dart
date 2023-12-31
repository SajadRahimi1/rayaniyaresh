import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> reserveNurses(
    String? userId, String nurseId, String days, String token) async {
  return await getConnect.post(
      reserveNurseUrl, {"userId": userId, "nurseId": nurseId, "days": days},
      headers: tokenHeader(token));
}


Future<Response<dynamic>> getReserveNurses( String token) async {
  return await getConnect.get(
      getReserveNurseUrl,
      headers: tokenHeader(token));
}