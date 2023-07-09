import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/get_connect.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

Future<Response<dynamic>> checkToken(String token) async {
  final _request =
      await getConnect.get(getUserUrl, headers: {"Authorization": token});
  return _request;
}
