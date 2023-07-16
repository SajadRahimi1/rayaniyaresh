import 'dart:io';
import 'package:get/get_connect.dart';
import 'package:rayaniyaresh/core/services/token_header_service.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> checkToken(String token) async {
  return await getConnect.get(getUserUrl, headers: {"Authorization": token});
}

Future<Response<dynamic>> updateUser(Map user, String token) async {
  return await getConnect.put(updateUserUrl, user, headers: tokenHeader(token));
}

Future<Response<dynamic>> updateImage(
    String token, File image, String fileName) async {
  final formData = FormData({
    'image': MultipartFile(image,
        filename: fileName, contentType: 'multipart/form-data')
  });
  return await getConnect.post(updateUserImageUrl, formData,
      headers: tokenHeader(token));
}

Future<Response<dynamic>> getReserved(String token) async {
  return await getConnect.get(getReservedUrl, headers: {"Authorization": token});
}
