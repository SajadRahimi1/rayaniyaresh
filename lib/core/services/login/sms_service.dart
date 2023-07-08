import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> sendSms(String phoneNumber) async {
  final _request = await getConnect.get(
    sendSmsUrl,
    query: {"phoneNumber": phoneNumber},
  );
  return _request;
}

Future<Response<dynamic>> checkSms(String phoneNumber, String code) async {
  final _request = await getConnect.post(
    checkSmsUrl,
    {"phoneNumber": phoneNumber, "code": code},
  );
  return _request;
}
