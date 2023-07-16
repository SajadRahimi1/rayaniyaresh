import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> getAllClasses() async {
  return await getConnect.get(getClassesUrl, headers: {'accept': '*/*'});
}

Future<Response<dynamic>> getSingleClass(String title) async {
  return await getConnect.get(getSingleClassUrl, query: {'title': title});
}

Future<Response<dynamic>> ReserveClass(
    {required String token,
    required String day,
    required String hours,
    required String classCategoryId,
    bool isInstallment = false}) async {
  return await getConnect.post(
      reserveClassUrl,
      {
        "classCategoryId": classCategoryId,
        "day": day,
        "hours": hours,
        "isInstallment": isInstallment
      },
      headers: tokenHeader(token));
}
