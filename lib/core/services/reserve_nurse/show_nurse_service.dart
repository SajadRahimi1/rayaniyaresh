import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> getNurses() async {
  return await getConnect.get(nurseUrl);
}
