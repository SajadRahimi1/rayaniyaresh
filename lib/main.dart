import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp;
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';
import 'package:rayaniyaresh/views/pages/splash_screen.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  String? link;
  try {
    link = await getInitialLink();
    print(link);
  } catch (_) {}
  runApp(MyApp(
    url: link,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.url}) : super(key: key);
  final String? url;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Sans",
      ),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      // home: const GetPhoneScreen()
      home: url == null ? const SplashSrceen() : const GetPhoneScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
