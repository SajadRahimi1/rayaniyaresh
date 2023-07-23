import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/create_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_uploads_screen.dart';
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
                            value: _controller.categorySelect.value == 0,
                            onChanged: (value) {
                              if (value != null) {
                                _controller.categorySelect.value = 0;
                              }
                            },
                          )),
                      const Text("پرستار سالمند"),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.value == 1,
                            onChanged: (value) {
                              if (value != null) {
                                _controller.categorySelect.value = 1;
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
                            value: _controller.categorySelect.value == 2,
                            onChanged: (value) {
                              if (value != null) {
                                _controller.categorySelect.value = 2;
                              }
                            },
                          )),
                      const Text("همه موارد"),
                      Obx(() => Checkbox(
                            value: _controller.categorySelect.value == 3,
                            onChanged: (value) {
                              if (value != null) {
                                _controller.categorySelect.value = 3;
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
                        value: _controller.secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            _controller.secondQuestion.value = true;
                          }
                        },
                      )),
                  const Text("خیر"),
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
