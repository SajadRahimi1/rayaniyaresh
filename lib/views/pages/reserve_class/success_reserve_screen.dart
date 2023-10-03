import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/home/main_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class SuccessReserveScreen extends StatelessWidget {
  const SuccessReserveScreen({Key? key, this.message}) : super(key: key);
  final String? message;

  void finish() => Get.offAll(() => const MainScreen());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // finish();
        // return false;
        return true;
      },
      child: Scaffold(
        appBar: screensAppbar(context: context),
        body: Column(
          children: [
            Expanded(
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  message ??
                      "کارشناسان ما در کمتر از 24 ساعت آینده با شما در تماس خواهند بود",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: const Color(0xff000000), fontSize: Get.width / 22),
                ),
              )),
            ),
            InkWell(
              onTap: finish,
              child: Container(
                width: Get.width,
                height: Get.height / 13,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    color: buttonColor),
                child: Text(
                  "اتمام",
                  style: TextStyle(
                      color: const Color(0xffffffff), fontSize: Get.width / 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
