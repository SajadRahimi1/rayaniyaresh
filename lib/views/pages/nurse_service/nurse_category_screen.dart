import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/baby_sitter_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseCategoryScreen extends StatelessWidget {
  const NurseCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "خدمات پرستاری"),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              3,
              (index) => InkWell(
                    onTap: () => Get.to(() => const BabySitterScreen(),
                        transition: Transition.leftToRight),
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                      ),
                      width: Get.width,
                      height: Get.height / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              "assets/images/images/${[
                                "baby-sitter",
                                "oldage",
                                "patient"
                              ][index]}2.jpg",
                            ),
                          )),
                      child: Text(
                        ["پرستار کودک", "پرستار سالمند", "پرستار بیمار"][index],
                        style: TextStyle(
                            fontSize: Get.width / 15,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffffffff)),
                      ),
                    ),
                  ))),
    );
  }
}
