import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/home/main_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class SuccessReserveScreen extends StatelessWidget {
  const SuccessReserveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const MainScreen());
        return false;
      },
      child: Scaffold(
        appBar: screensAppbar(context: context),
        body: Center(
            child: Text(
          "کارشناسان ما در کمتر از 24 ساعت آینده با شما در تماس خواهند بود",
          textAlign: TextAlign.center,
          style: TextStyle(color: const Color(0xff000000), fontSize: Get.width / 22),
        )),
      ),
    );
  }
}
