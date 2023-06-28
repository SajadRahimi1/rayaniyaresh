import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/class_services.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class ClassSubcategoryScreen extends StatelessWidget {
  const ClassSubcategoryScreen({Key? key, required this.title})
      : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8FAFB),
        title: Text(title),
        centerTitle: true,
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
        childAspectRatio: 1.5,
        mainAxisSpacing: 13,
        children: List.generate(
          learningSerivces.length,
          (index) => Container(
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height / 5,
            decoration: BoxDecoration(
                color: randomColor[index],
                borderRadius: BorderRadius.circular(10)),
            child: Text(learningSerivces[index],
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
