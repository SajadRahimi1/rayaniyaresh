import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            8,
            (index) => Container(
                  alignment: Alignment.bottomRight,
                  width: Get.width,
                  height: Get.height,
                  decoration: BoxDecoration(
                      // color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage([
                            "assets/images/images/art_class.jpg",
                            "assets/images/images/math_class.jpg",
                            "assets/images/images/english_class.jpg",
                            "assets/images/images/computer_class.jpg",
                          ][index > 3 ? index - 4 : index]),
                          fit: BoxFit.fill)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, left: 5),
                          child: InkWell(
                            onTap: () {
                              if (favoritesList[index]) {
                                favoritesList[index] = false;
                              } else {
                                favoritesList[index] = true;
                              }
                            },
                            child: Obx(() => Icon(
                                  favoritesList[index]
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.red,
                                  size: 34,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        height: Get.height / 15,
                        width: Get.width,
                        padding:
                            const EdgeInsets.only(top: 4, right: 8, left: 8),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              [
                                "کلاس هنر",
                                "کلاس ریاضی",
                                "کلاس زبان",
                                "کلاس کامپیوتر"
                              ][index > 3 ? index - 4 : index],
                              style: TextStyle(
                                  fontSize: Get.width / 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Icon(Icons.arrow_forward,
                                color: Color(0xffffffff)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
