import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_uploads_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseSelectSreen extends StatelessWidget {
  const NurseSelectSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt categorySelect = (3).obs;
    RxBool secondQuestion = false.obs;
    return Scaffold(
      appBar: screensAppbar(context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              // child categorySelect
              const Text(
                "\nلطفا گزینه مورد نظر را در خصوص مراقبت انتخاب بفرمایید :\n",
                style: TextStyle(fontSize: 16),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("پرستار کودک"),
                      Obx(() => Checkbox(
                            value: categorySelect.value == 0,
                            onChanged: (value) {
                              if (value != null) {
                                categorySelect.value = 0;
                              }
                            },
                          )),
                      const Text("پرستار سالمند"),
                      Obx(() => Checkbox(
                            value: categorySelect.value == 1,
                            onChanged: (value) {
                              if (value != null) {
                                categorySelect.value = 1;
                              }
                            },
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text("پرستار بیمار"),
                      Obx(() => Checkbox(
                            value: categorySelect.value == 2,
                            onChanged: (value) {
                              if (value != null) {
                                categorySelect.value = 2;
                              }
                            },
                          )),
                      const Text("همه موارد"),
                      Obx(() => Checkbox(
                            value: categorySelect.value == 3,
                            onChanged: (value) {
                              if (value != null) {
                                categorySelect.value = 3;
                              }
                            },
                          )),
                    ],
                  )
                ],
              ),

              const Text(
                "\nآیا کودک - سالمند و یا بیمار از پوشک و یا لگن استفاده کند شما میتوانید انجام دهید؟\n",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text("بله"),
                  Obx(() => Checkbox(
                        value: secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            secondQuestion.value = true;
                          }
                        },
                      )),
                  const Text("خیر"),
                  Obx(() => Checkbox(
                        value: !secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            secondQuestion.value = false;
                          }
                        },
                      )),
                ],
              ),
            ]),
          ),
          NextStepButton(
            title: "مرحله بعدی",
            onTap: () => Get.to(() => const NurseUploadsScreen(),
                transition: Transition.leftToRight),
          )
        ],
      ),
    );
  }
}
