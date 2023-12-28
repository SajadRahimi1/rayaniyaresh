import 'package:device_apps/device_apps.dart';
import 'package:get/get_connect/connect.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

final GetConnect _getConnect =
    GetConnect(allowAutoSignedCert: true, timeout: const Duration(seconds: 10));
Future<void> checkVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String version = packageInfo.version;
  String buildNumber = packageInfo.buildNumber;
  print(version);
  print(buildNumber);
  var request = await _getConnect.get(
      'https://api.pishkhan.cafebazaar.ir/v1/apps/releases/last-published',
      headers: {
        'CAFEBAZAAR-PISHKHAN-API-SECRET':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJuYXNoZXItcGlzaGtoYW4tYXBpIiwiaWF0IjoxNzAxNzg2MTU2LCJleHAiOjQ4NTUzODYxNTYsImFwaV9hZ2VudF9pZCI6MjMzNX0.0HUzWbPm6yLvJ9cNKR9ZH-vQKMBWnAFt8fKwiOgfF8o'
      });
  if (request.statusCode == 200) {
    var bazzarVersion = request.body['release']['packages'][0]['version_name'];
    if (version != bazzarVersion) {
      showDialog();
    }
  }
}

void showDialog() => showSnackbar(
    onValue: (value) async {
      if (value != null) {
        if (value) {
          bool isInstall =
              await DeviceApps.isAppInstalled('ir.mservices.market');
          if (isInstall) {
            await launchUrlString('https://myket.ir/app/com.asiasalamat.app',
                mode: LaunchMode.externalApplication);
          } else {
            await launchUrlString(
                'https://cafebazaar.ir/app/com.asiasalamat.app',
                mode: LaunchMode.externalApplication);
          }
          showDialog();
        }
      } else {
        showDialog();
      }
    },
    isUpdateDialog: true,
    message: 'برای استفاده از اپ اخرین نسخه را دانلود کنید',
    title: 'به روز رسانی');
