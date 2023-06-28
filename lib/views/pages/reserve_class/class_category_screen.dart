import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_subcategory_screen.dart';

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
            (index) => InkWell(
                  onTap: () => Get.to(
                      () => ClassSubcategoryScreen(title: "خدمات آموزشی")),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    width: Get.width,
                    height: Get.height,
                    decoration: BoxDecoration(
                        // color: Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/images/" +
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
                            ),
                            fit: BoxFit.fill)),
                    child: Container(
                      alignment: Alignment.center,
                      height: Get.height / 15,
                      width: Get.width,
                      padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color.fromRGBO(0, 0, 0, .7),
                                Color.fromRGBO(0, 0, 0, 0.2),
                              ])),
                      child: Text(
                        [
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
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: Get.width / 28,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }
}
