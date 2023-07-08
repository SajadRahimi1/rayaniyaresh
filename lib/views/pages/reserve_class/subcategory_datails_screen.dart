import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/information_form_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/subcategory_cons_widget.dart';

class SubcategoryDetailScreen extends StatelessWidget {
  const SubcategoryDetailScreen({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: title),
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 20,
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "جمع کل ساعت آموزشی 48 ساعت (عملی و توری)",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "زمان برگزاری کلاس : 15 روز بعد از ثبت نام نهایی",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "ارایه مدرک بین المللی و قابل ترجمه از سازمان فنی و حرفه ای",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "مبلغ شهریه 45/000/000 میلیون ریال (نقد و اقساط)",
          ),
          const Text(
            "شرایط اقساط",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "پیش پرداخت: 15/000/000 میلیون ریال",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "تعداد قسط ماهانه : 2",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "مبلغ قسط ماهانه: 15/000/000 میلیون ریال",
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.to(() => const InformationFormScreen(),
                  transition: Transition.leftToRight),
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
                      color: Color(0xffffffff), fontSize: Get.width / 22),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
