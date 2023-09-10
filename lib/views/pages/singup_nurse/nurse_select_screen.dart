import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/create_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseSelectSreen extends StatelessWidget {
  const NurseSelectSreen({Key? key, required this.nurseModel})
      : super(key: key);
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CreateNurrseViewModel(nurseModel));

    return Scaffold(
      appBar: screensAppbar(context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(children: [
              // child _controller.categorySelect
              Text(
                "\nلطفا گزینه مورد نظر را در خصوص مراقبت انتخاب بفرمایید :\n",
                style: TextStyle(fontSize: Get.width / 27),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("پرستار کودک",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.contains(0),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addCategory(0);
                                } else {
                                  _controller.categorySelect.remove(0);
                                }
                              }
                            },
                          )),
                      Text("پرستار سالمند",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.contains(1),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addCategory(1);
                                } else {
                                  _controller.categorySelect.remove(1);
                                }
                              }
                            },
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("پرستار بیمار",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.contains(2),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addCategory(2);
                                } else {
                                  _controller.categorySelect.remove(2);
                                }
                              }
                            },
                          )),
                      Text("همه موارد",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.contains(3),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addCategory(3);
                                } else {
                                  _controller.categorySelect.clear();
                                }
                              }
                            },
                          )),
                    ],
                  )
                ],
              ),

              Text(
                "\nآیا کودک - سالمند و یا بیمار از پوشک و یا لگن استفاده کند شما میتوانید انجام دهید؟\n",
                style: TextStyle(fontSize: Get.width / 27),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("بله", style: TextStyle(fontSize: Get.width / 30)),
                  Obx(() => Checkbox(
                        value: _controller.secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            _controller.secondQuestion.value = true;
                          }
                        },
                      )),
                  Text("خیر", style: TextStyle(fontSize: Get.width / 30)),
                  Obx(() => Checkbox(
                        value: !_controller.secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            _controller.secondQuestion.value = false;
                          }
                        },
                      )),
                ],
              ),
            ]),
          ),
          NextStepButton(title: "مرحله بعدی", onTap: _controller.createNurse)
        ],
      ),
    );
  }
}
