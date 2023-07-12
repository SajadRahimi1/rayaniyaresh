import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> getAllClasses() async {
  return await getConnect.get(getClassesUrl, headers: {'accept': '*/*'});
}

Future<Response<dynamic>> getSingleClass(String title) async {
  return await getConnect.get(getSingleClassUrl,query: {'title':title});
}
