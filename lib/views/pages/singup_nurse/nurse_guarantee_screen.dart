import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_download_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class NurseGuaranteeScreen extends StatelessWidget {
  const NurseGuaranteeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          screensAppbar(context: context, title: "اطلاعات دوستان و آشنایان"),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\nلطفا 3 نفر را معرفی بفرمایید که شما را میشناسد:\n",
                style: TextStyle(fontSize: Get.width / 22),
              ),
              SizedBox(
                  width: Get.width,
                  height: Get.height / 8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: Get.height / 9,
                          width: Get.width / 4.5,
                          child: ProfileTextInput(text: "آقا/خانم"),
                        ),
                        SizedBox(
                          width: Get.width / 10,
                        ),
                        SizedBox(
                          height: Get.height / 9,
                          width: Get.width / 5,
                          child: ProfileTextInput(text: "نسبت"),
                        ),
                        SizedBox(
                          width: Get.width / 10,
                        ),
                        SizedBox(
                          height: Get.height / 9,
                          width: Get.width / 5,
                          child: ProfileTextInput(text: "مدت آشنایی"),
                        ),
                        SizedBox(
                          width: Get.width / 10,
                        ),
                        SizedBox(
                          width: Get.width / 3,
                          height: Get.height / 9,
                          child: ProfileTextInput(text: "شماره تماس"),
                        ),
                      ],
                    ),
                  )),
              const ProfileTextInput(text: "شماره تماس همسر"),
              const SizedBox(
                height: 15,
              ),
              const ProfileTextInput(text: "شماره تماس فرزند"),
              const SizedBox(
                height: 15,
              ),
              const ProfileTextInput(text: "شماره تماس سرپرست خانواده"),
              const SizedBox(
                height: 15,
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff000000),
              ),
              Text(
                "\nدر صورت مشغول به کار شدن کدام یک از موارد را جهت ضمانت میتوانید نزد شرکت قرار دهید؟\n",
                style: TextStyle(fontSize: Get.width / 24),
              ),
              Row(
                children: [
                  Text(
                    "سفته (به مبلغ 50 میلیون تومان)",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
              Row(
                children: [
                  Text(
                    "چک به ارزش 100 میلیون تومان",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
              Row(
                children: [
                  Text(
                    "جواز کسب",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
              Row(
                children: [
                  Text(
                    "معرف (کارمند دولتی)",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Checkbox(value: false, onChanged: (value) {})
                ],
              ),
              SizedBox(
                height: Get.height / 20,
              )
            ],
          ),
        ),
        NextStepButton(
          title: "مرحله بعدی",
          onTap: () => Get.to(() => const NurseDownloadScreen()),
        )
      ]),
    );
  }
}
