import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class FinalStepScreen extends StatelessWidget {
  const FinalStepScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "پرستار کودک"),
      body: Column(children: [
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(text: "نام و نام خانوادگی")),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(text: "شماره تماس")),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(text: "نحوه آشنایی با ما")),

        // button
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () {
            FocusNode().unfocus();
            Get.to(
                () => const SuccessReserveScreen(
                      message:
                          "کارشناسان ما در کمتر از 30 دقیقه آینده با شما جهت ارایه توضیحات بیشتر تماس میگیرند",
                    ),
                transition: Transition.leftToRight);
          },
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
              "ثبت نهایی",
              style: TextStyle(
                  color: const Color(0xffffffff), fontSize: Get.width / 22),
            ),
          ),
        ),
      ]),
    );
  }
}
