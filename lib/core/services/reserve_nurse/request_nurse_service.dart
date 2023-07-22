import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';

Future<Response<dynamic>> requestNurses(
    RequestNurseModel model, String token) async {
  return await getConnect.post(
      reserveNurseUrl,
      {
        "gender": model.gender,
        "age": model.age,
        "shift": model.shift,
        "hours": model.hours,
        "peopleInHouse": model.peopleInHouse,
        "cctv": model.cctv,
        "address": model.address,
        "nurseCategory": model.nurseCategory
      },
      headers: tokenHeader(token));
}
