import 'dart:io';
import 'dart:typed_data';
import 'package:get/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> uploadImages(String id, File picture,
    File firstPageImage, File descriptionImage, File? agreementImage) async {
  final formData = FormData({
    'NurseId': id,
    'Picture': picture.path.isEmpty
        ? null
        : MultipartFile(picture,
            filename: picture.path.split('/').last,
            contentType: 'multipart/form-data'),
    'FirstPageImage': firstPageImage.path.isEmpty
        ? null
        : MultipartFile(firstPageImage,
            filename: firstPageImage.path.split('/').last,
            contentType: 'multipart/form-data'),
    'DescriptionImage': descriptionImage.path.isEmpty
        ? null
        : MultipartFile(descriptionImage,
            filename: descriptionImage.path.split('/').last,
            contentType: 'multipart/form-data'),
    'AgreementImage': agreementImage == null
        ? null
        : MultipartFile(agreementImage,
            filename: agreementImage.path.split('/').last,
            contentType: 'multipart/form-data'),
  });

  var request = await GetConnect(
          allowAutoSignedCert: true, timeout: const Duration(minutes: 4))
      .put(
    nurseUploadsUrl,
    formData,
  );
  return request;
}

Future<Response<dynamic>> uploadPdfFile(
    Uint8List fileBytes, String id, String fileName) async {
  final formData = FormData({
    'nurseId': id,
    'pdf': MultipartFile(fileBytes,
        filename: fileName, contentType: 'multipart/form-data'),
  });

  return await GetConnect(
          allowAutoSignedCert: true, timeout: const Duration(minutes: 4))
      .post(
    nurseUploadPdfUrl,
    formData,
  );
}
