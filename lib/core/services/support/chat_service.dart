import 'dart:io';

import 'package:get/get_connect/connect.dart';
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

Future<Response<dynamic>> sendFile(String path,String token) async {
  FormData formData = FormData({
    'Content': path,   
    'MessageType': 'image',
    'file': MultipartFile(File(path),
        filename: path.split('/').last, contentType: 'multipart/form-data'),
  });
  return await GetConnect(
          allowAutoSignedCert: true, timeout: const Duration(minutes: 1))
      .post(
        sendMessageUrl,
        formData,
         headers: tokenHeader(token)
      )
      .onError((error, stackTrace) => const Response(statusCode: 500));
}