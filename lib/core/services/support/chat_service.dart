import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> getMessages(String token) async {
  return await getConnect.get(getMessagesUrl, headers: tokenHeader(token));
}

Future<Response<dynamic>> sendMessage(String token, String message) async {
  final formData = FormData({
    'Content': message,
    'MessageType': "text",
  });
  return await getConnect.post(sendMessageUrl, formData,
      headers: tokenHeader(token));
}
