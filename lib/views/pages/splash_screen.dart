import 'package:flutter/material.dart';
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';

class SplashSrceen extends StatelessWidget {
  const SplashSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(
        const Duration(milliseconds: 7300),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const GetPhoneScreen(),
            )));
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/images/images/splash.gif",
        ),
      ),
    );
  }
}
