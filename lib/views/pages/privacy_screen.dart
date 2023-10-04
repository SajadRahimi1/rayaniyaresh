import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "حریم خصوصی"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  "\nآسیاسلامت به حریم خصوصی کاربران خود احترام می‌گذارد و متعهد به حفاظت از اطلاعات شخصی است که شما در اختیار آن می‌گذارید.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
                Text(
                  "\nبرای ورود به اپ آسیاسلامت فقط شماره تلفن از شما دریافت میگردد باقی اطلاعات مورد نیاز هنگام ثبت سفارش یا استخدام از شما دریافت میگردد",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
                Text(
                  "\nمطمئن باشید هر اطلاعات و تصاویری از شما دریافت میشود صرفا برای تایید هویت و استخدام است و به هیچ عنوان در اختیار دیگران قرار داده نمیشود",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
                Text(
                  "\nزمانی که احتیاج به انتخاب عکس باشد برنامه از شما دسترسی گالری میگرد و این صرفا جهت انتخاب عکس میباشد و به هیچ وجه بدون اجازه یا انتخاب شما از گالری عکسی استخراج نمیکند",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
