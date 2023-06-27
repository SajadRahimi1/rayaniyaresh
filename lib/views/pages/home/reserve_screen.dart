import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_category_screen.dart';
import 'package:rayaniyaresh/views/pages/reserve_nurse/show_nerse_screen.dart';

class ReserveScreen extends StatelessWidget {
  const ReserveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                    top: Get.height / 18, bottom: Get.height / 15),
                child: Image.asset(
                  "assets/images/images/reserve.png",
                  width: Get.width / 2,
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => const ShowNerseScreen(),
                  transition: Transition.downToUp),
              child: Container(
                width: Get.width / 1.1,
                height: Get.height / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/images/reserve_nurse.png"),
                        fit: BoxFit.fill)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
            InkWell(
              onTap: () => Get.to(() => const ClassCategoryScreen(),
                  transition: Transition.downToUp),
              child: Container(
                margin: EdgeInsets.only(
                  top: Get.height / 25,
                ),
                width: Get.width / 1.1,
                height: Get.height / 5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/images/reserve_class.png"),
                        fit: BoxFit.fill)),
                child: const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          ],
        ));
  }
}
