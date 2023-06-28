import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/date_time_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class ClassSubcategoryScreen extends StatelessWidget {
  const ClassSubcategoryScreen(
      {Key? key, required this.title, required this.subcategory})
      : super(key: key);
  final String title;
  final List subcategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: title),
      body: GridView.count(
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: Get.width / 28,
        padding: const EdgeInsets.symmetric(horizontal: 10) +
            const EdgeInsets.only(top: 8),
        crossAxisCount: 2,
        childAspectRatio: 1.5,
        mainAxisSpacing: 13,
        children: List.generate(
          subcategory.length,
          (index) => InkWell(
            onTap: () => Get.to(() => DateTimeScreen(title: subcategory[index]),
                transition: Transition.leftToRight),
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height / 5,
              decoration: BoxDecoration(
                  color: randomColor[index],
                  borderRadius: BorderRadius.circular(10)),
              child: Text(subcategory[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
