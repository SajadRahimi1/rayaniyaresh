import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/class_services.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_subcategory_screen.dart';
import 'package:rayaniyaresh/views/widgets/class_category_widget.dart';

class ClassCategoryScreen extends StatelessWidget {
  const ClassCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxList<bool> favoritesList = List.generate(8, (index) => false).obs;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8FAFB),
        elevation: 5,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Color(0xff000000)),
              onPressed: () => Get.back(),
            ),
          )
        ],
      ),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: Get.width / 28,
        padding: const EdgeInsets.symmetric(horizontal: 10) +
            const EdgeInsets.only(top: 8),
        crossAxisCount: 2,
        childAspectRatio: .7,
        mainAxisSpacing: 13,
        children: List.generate(
            9,
            (index) => ClassCategoryWidget(
                  enable: index == 0 || index == 1,
                  onTap: () {
                    if (index == 0 || index == 1) {
                      Get.to(() => ClassSubcategoryScreen(
                          subcategory: [
                            learningSerivces,
                            healthcareServices
                          ][index],
                          title: ["خدمات آموزشی", "بهداشت و ایمنی"][index]));
                    }
                  },
                  title: [
                    "خدمات آموزشی",
                    "بهداشت و ایمنی",
                    "امور اداری(بزودی)",
                    "فناوری اطلاعات(بزودی)",
                    "گردشگری(یزودی)",
                    "مراقبت و زیبایی(بزودی)",
                    "هنرهای تجسمی(بزودی)",
                    "هنر های نمایشی(بزودی)",
                    "زبان انگلیسی(بزودی)",
                  ][index],
                  image: "assets/images/images/" +
                      [
                        "educational",
                        "helthcare",
                        "office",
                        "computer_class",
                        "tourism",
                        "bcare",
                        "art2",
                        "show",
                        "english_class"
                      ][index] +
                      "2.png",
                )),
      ),
    );
  }
}
