import 'package:flutter/material.dart';

class SplashSrceen extends StatelessWidget {
  const SplashSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb7b6b9),
      body: Center(
        child: Image.asset(
          "assets/images/images/motion.gif",
        ),
      ),
    );
  }
}
