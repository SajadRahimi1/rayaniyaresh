import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:gif/gif.dart';
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';

class SplashSrceen extends StatelessWidget {
  const SplashSrceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 4500),
        () => Get.offAll(() => const GetPhoneScreen()));
    // GifController _controller = GifController(vsync: this);

    return Scaffold(
      backgroundColor: const Color(0xff171717),
      body: Center(
          child: Gif(
        image: const AssetImage("assets/images/images/splash2.gif"),
        // fps: 1,
        fps: 20,
        autostart: Autostart.once,
      ) // onFetchCompleted: () => Get.offAll(() => const GetPhoneScreen())),
          ),
    );
  }
}
