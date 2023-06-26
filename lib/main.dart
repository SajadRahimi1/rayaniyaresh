import 'package:flutter/material.dart';
import 'package:get/get.dart' show GetMaterialApp;
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "Sans",
      ),
      debugShowCheckedModeBanner: false,
      home: const GetPhoneScreen(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
