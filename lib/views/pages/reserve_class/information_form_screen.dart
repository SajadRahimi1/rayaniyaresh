import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as picker;

class InformationFormScreen extends StatelessWidget {
  const InformationFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController textInputController = TextEditingController();
    return Scaffold(
      appBar: screensAppbar(context: context, title: "اطلاعات شخصی"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 25, vertical: Get.height / 35),
            child: Column(
              children: [
                ProfileTextInput(
                    text: "نام و نام خانوادگی",
                    icon: Icon(
                      Icons.person,
                    )),
                ProfileTextInput(
                  text: "نام پدر",
                  icon: Icon(Icons.family_restroom),
                ),
                ProfileTextInput(
                    text: "تاریخ تولد",
                    enable: false,
                    controller: textInputController,
                    ontap: () async {
                      picker.Jalali? picked =
                          await picker.showPersianDatePicker(
                        context: context,
                        initialDate: picker.Jalali.now(),
                        firstDate: picker.Jalali(1330, 8),
                        lastDate: picker.Jalali.now(),
                      );
                      if (picked != null) {
                        // _controller.birthday.value = picked.formatCompactDate();
                        textInputController.text = picked.formatCompactDate();
                      }
                    },
                    icon: Icon(
                      Icons.calendar_month,
                    )),
                ProfileTextInput(
                    text: "محل صدور", icon: Icon(Icons.location_city)),
                ProfileTextInput(
                  text: "کد ملی",
                  icon: Icon(Icons.public),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                ),
                ProfileTextInput(
                  text: "شماره شناسنامه",
                  icon: Icon(Icons.public_sharp),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                ),
                ProfileTextInput(
                  text: "آدرس محل سکونت",
                  icon: Icon(Icons.pin_drop),
                ),
                ProfileTextInput(
                  text: "شماره تلفن همراه",
                  icon: Icon(Icons.phone_android),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                ),
                ProfileTextInput(
                  text: "شماره ضروری",
                  icon: Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
