import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/nurse_category_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class BioScreenn extends StatelessWidget {
  const BioScreenn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(left: 11, right: 11, top: Get.height / 25),
          width: Get.width,
          height: Get.height / 4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage("assets/images/images/a.png"),
                  fit: BoxFit.fill)),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: Get.height / 15),
          child: Text(
            "هلدینگ آسیاسلامت در سال 1392 تاسیس گردید که در نهایت ار سال 1397 به طور رسمی وارد بازار کار شد. این مجموعه با حمایت شما شهروندان گرامی از سال 1398 افدام به تاسیس شعب در 12 استان ایران عزیزمان نمود",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: Get.width / 22),
          ),
        ),
        Expanded(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () {
              Get.to(() => const NurseCategoryScreen(),
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
                "مرحله بعدی",
                style: TextStyle(
                    color: const Color(0xffffffff), fontSize: Get.width / 22),
              ),
            ),
          ),
        ))
      ]),
    );
  }
}
