import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> createNurse(String authority, String id) async {
  return await getConnect.post(checkPaymentUrl,{
    'id':id,
    'authority':authority
  });
}