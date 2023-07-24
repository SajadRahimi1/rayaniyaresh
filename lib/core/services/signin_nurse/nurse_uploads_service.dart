import 'dart:io';
import 'package:get/get_connect.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> uploadImages(String id, File picture,
    File firstPageImage, File descriptionImage, File? agreementImage) async {
  final formData = FormData({
    'NurseId': id,
    'Picture': MultipartFile(picture,
        filename: picture.path.split('/').last,
        contentType: 'multipart/form-data'),
    'FirstPageImage': MultipartFile(firstPageImage,
        filename: firstPageImage.path.split('/').last,
        contentType: 'multipart/form-data'),
    'DescriptionImage': MultipartFile(descriptionImage,
        filename: descriptionImage.path.split('/').last,
        contentType: 'multipart/form-data'),
    'AgreementImage': agreementImage == null
        ? null
        : MultipartFile(agreementImage,
            filename: agreementImage.path.split('/').last,
            contentType: 'multipart/form-data'),
  });

  return await getConnect.put(nurseUploadsUrl, formData);
}
