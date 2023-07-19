import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/final_step_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class BabySitterScreen extends StatelessWidget {
  const BabySitterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt gender = (-1).obs;
    RxInt childNumber = (1).obs;
    RxInt shiftWork = (1).obs;
    RxBool camera = false.obs;
    return Scaffold(
        appBar: screensAppbar(context: context, title: "پرستار کودک"),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10) +
                const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // child number
                Row(
                  children: [
                    Text(
                      "تعداد کودک: " "   ",
                      style: TextStyle(fontSize: Get.width / 23),
                    ),
                    Obx(() => DropdownButton(
                        items: List.generate(
                            4,
                            (index) => DropdownMenuItem<int>(
                                  child: Text(
                                    (index + 1).toString(),
                                  ),
                                  value: index + 1,
                                )),
                        value: childNumber.value,
                        elevation: 5,
                        // style: TextStyle(fontSize: Get.width / 23),
                        onChanged: <int>(value) => childNumber.value = value)),
                  ],
                ),

                const Divider(thickness: 1),

                // child gender
                Row(
                  children: [
                    Text("جنسیت:" "  "),
                    const Text("پسر"),
                    Obx(() => Checkbox(
                          value: gender == 0,
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 0;
                            }
                          },
                        )),
                    const Text("دختر"),
                    Obx(() => Checkbox(
                          value: gender == 1,
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 1;
                            }
                          },
                        )),
                    const Text("هر دو"),
                    Obx(() => Checkbox(
                          value: gender == 2,
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 2;
                            }
                          },
                        )),
                  ],
                ),

                const Divider(thickness: 1),

                // children ages
                Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          childNumber.value,
                          (index) => SizedBox(
                                width: Get.width / 5,
                                child: ProfileTextInput(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  text: "سن کودک ${index + 1}",
                                ),
                              )),
                    )),

                const Divider(thickness: 1),

                // child gender
                SizedBox(
                  height: Get.height / 30,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      const Text("شیفت کاری:" "  "),
                      const Text("شبانه روزی"),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 0,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 0;
                              }
                            },
                          )),
                      const Text("شبانه"),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 1,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 1;
                              }
                            },
                          )),
                      const Text("مقطعی"),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 2,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 2;
                              }
                            },
                          )),
                    ],
                  ),
                ),

                const Divider(thickness: 1),

                // hour of work
                Row(
                  children: [
                    const Text("ساعت کاری از   "),
                    SizedBox(
                        width: Get.width / 7,
                        child: const ProfileTextInput(
                          textAlign: TextAlign.center,
                          text: "ساعت",
                          keyboardType: TextInputType.number,
                        )),
                    const Text("  تا      "),
                    SizedBox(
                        width: Get.width / 7,
                        child: const ProfileTextInput(
                          textAlign: TextAlign.center,
                          text: "ساعت",
                          keyboardType: TextInputType.number,
                        )),
                  ],
                ),

                const Divider(thickness: 1),

                // person in home
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Text(
                            "در طول مدت فعالیت نیروی اعزامی چه شخصی داخل منزل حضور دارد:   ",
                            style: TextStyle(fontSize: Get.width / 28),
                          ),
                          SizedBox(
                            width: Get.width / 2.5,
                            child: const ProfileTextInput(
                              text: "",
                            ),
                          )
                        ]))),

                const Divider(thickness: 1),

                // camera
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Text(
                            "آیا در محل نیروی اعزامی دوربین مداربسته وجود دارد؟:   ",
                            style: TextStyle(fontSize: Get.width / 28),
                          ),
                          Obx(() => DropdownButton(
                              items: List.generate(
                                  2,
                                  (index) => DropdownMenuItem<bool>(
                                        child: Text(["خیر", "بلی"][index]),
                                        value: [false, true][index],
                                      )),
                              value: camera.value,
                              elevation: 5,
                              // style: TextStyle(fontSize: Get.width / 23),
                              onChanged: <bool>(value) =>
                                  camera.value = value)),
                        ]))),

                const Divider(thickness: 1),

                // address
                SizedBox(
                  width: Get.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const Text("محدوده محل سکونت:  "),
                        const Text("استان:  "),
                        SizedBox(
                            width: Get.width / 6.5,
                            child: const ProfileTextInput(
                              textAlign: TextAlign.center,
                              text: "",
                              keyboardType: TextInputType.number,
                            )),
                        const Text("شهر:  "),
                        SizedBox(
                            width: Get.width / 7,
                            child: const ProfileTextInput(
                              textAlign: TextAlign.center,
                              text: "",
                              keyboardType: TextInputType.number,
                            )),
                        const Text("محله:  "),
                        SizedBox(
                            width: Get.width / 7,
                            child: const ProfileTextInput(
                              textAlign: TextAlign.center,
                              text: "",
                              keyboardType: TextInputType.number,
                            )),
                      ],
                    ),
                  ),
                ),

                const Divider(thickness: 1),

                // description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 8,
                    child: TextFormField(
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          labelText: "توضیحات",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),

                // button
              ],
            ),
          ),
          InkWell(
            onTap: () {
              FocusNode().unfocus();
              Get.to(() => const FinalStepScreen());
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
        ]));
  }
}
