import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/baby_sitter_screen.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/oldage_form_screen.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/patient_form_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseCategoryScreen extends StatelessWidget {
  const NurseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "درخواست پرستار"),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => InkWell(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Get.to(() => const BabySitterScreen(),
                              transition: Transition.leftToRight);
                          break;
                        case 1:
                          Get.to(() => const OldageFormScreen(),
                              transition: Transition.leftToRight);
                          break;
                        case 2:
                          Get.to(() => const PatientFormScreen(),
                              transition: Transition.leftToRight);
                          break;
                      }
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "assets/images/images/${[
                                "nurse child.png",
                                "elderly nurse.png",
                                "sick nurse.jpg"
                              ][index]}",
                              fit: BoxFit.fill,
                              width: Get.width,
                              height: Get.height / 5,
                            ),
                          ),
                        ),
                        Text(
                          [
                            "پرستار کودک",
                            "پرستار سالمند",
                            "پرستار بیمار"
                          ][index],
                          style: TextStyle(
                              fontSize: Get.width / 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff000000)),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
