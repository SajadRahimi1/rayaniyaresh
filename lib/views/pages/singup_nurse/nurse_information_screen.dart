import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_information_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_questions_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/payment_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as picker;

class NurseInformationScreen extends StatelessWidget {
  const NurseInformationScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(NurseInformationViewmodel());
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
                  controller: _controller.textEditingController[0],
                  text: "نام و نام خانوادگی",
                  icon: const Icon(
                    Icons.person,
                  ),
                  onChanged: (value) {
                    // _controller.userModel?.name = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[1],
                  text: "نام پدر",
                  icon: const Icon(Icons.family_restroom),
                  onChanged: (value) {
                    // _controller.userModel?.fatherName = value;
                  },
                ),
                ProfileTextInput(
                    text: "تاریخ تولد",
                    enable: false,
                    controller: _controller.textEditingController[2],
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
                        _controller.textEditingController[2].text =
                            picked.formatCompactDate();
                        // _controller.userModel?.birthday =
                        // picked.formatCompactDate();
                      }
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                    )),
                ProfileTextInput(
                  controller: _controller.textEditingController[3],
                  text: "محل صدور",
                  icon: const Icon(Icons.location_city),
                  onChanged: (value) {
                    // _controller.userModel?.bornCity = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[4],
                  text: "کد ملی",
                  icon: const Icon(Icons.public),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // _controller.userModel?.nationalCode = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[5],
                  text: "شماره شناسنامه",
                  icon: const Icon(Icons.public_sharp),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    // _controller.userModel?.nationalNumber = value;
                  },
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 10,
                  child: Row(
                    children: [
                      const Text("میزان تحصیلات : ",
                          style: TextStyle(fontSize: 14)),
                      Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) => InkWell(
                                    onTap: () =>
                                        _controller.education.value = index,
                                    child: Obx(() => Container(
                                          width: Get.width / 5.5,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3,
                                              vertical: Get.height / 80),
                                          height: Get.height,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: _controller
                                                          .education.value ==
                                                      index
                                                  ? Colors.green
                                                  : const Color(0xffe5e5e5)),
                                          child: Text(
                                            _controller.educationStrings[index],
                                            textAlign: TextAlign.center,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        )),
                                  )))
                    ],
                  ),
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[6],
                  text: "آدرس دقیق منزل",
                  icon: const Icon(Icons.pin_drop),
                  onChanged: (value) {
                    // _controller.userModel?.address = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[7],
                  text: "شماره تلفن همراه",
                  icon: const Icon(Icons.phone_android),
                  keyboardType: TextInputType.number,
                  enable: false,
                  maxLength: 11,
                  onChanged: (value) {
                    // _controller.userModel?.phoneNumber = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[8],
                  text: "شماره تلفن منزل",
                  icon: const Icon(Icons.phone),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  onChanged: (value) {
                    // _controller.userModel?.emergancyNumber = value;
                  },
                ),
              ],
            ),
          ),
          // button
          InkWell(
            onTap: () async {
              Get.to(() => const NurseQuestionScreen(),
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
        ],
      ),
    );
  }
}