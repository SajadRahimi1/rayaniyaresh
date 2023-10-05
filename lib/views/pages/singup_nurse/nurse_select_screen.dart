import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/create_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';

class NurseSelectSreen extends StatelessWidget {
  const NurseSelectSreen({Key? key, required this.nurseModel})
      : super(key: key);
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(CreateNurrseViewModel(nurseModel));

    return Scaffold(
      appBar: screensAppbar(context: context, title: 'شرایط همکاری'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // child _controller.categorySelect
              Text(
                "\nلطفا گزینه مورد نظر را در خصوص مراقبت انتخاب بفرمایید :\n",
                style: TextStyle(fontSize: Get.width / 30),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("پرستار کودک",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
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
                            activeColor: buttonColor,
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
                            activeColor: buttonColor,
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
                            activeColor: buttonColor,
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
                style: TextStyle(fontSize: Get.width / 30),
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Spacer(),
                  Text("بله", style: TextStyle(fontSize: Get.width / 30)),
                  Obx(() => Checkbox(
                        value: _controller.secondQuestion.value,
                        activeColor: buttonColor,
                        onChanged: (value) {
                          if (value != null) {
                            _controller.secondQuestion.value = true;
                          }
                        },
                      )),
                  const Spacer(),
                  Text("خیر", style: TextStyle(fontSize: Get.width / 30)),
                  Obx(() => Checkbox(
                        activeColor: buttonColor,
                        value: !_controller.secondQuestion.value,
                        onChanged: (value) {
                          if (value != null) {
                            _controller.secondQuestion.value = false;
                          }
                        },
                      )),
                  const Spacer(),
                ],
              ),

              Text(
                "\nمیخواهید در کدام شیفت کار کنید :\n",
                style: TextStyle(fontSize: Get.width / 30),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("شبانه روزی",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(0),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addShift(0);
                                } else {
                                  _controller.shiftSelect.remove(0);
                                }
                              }
                            },
                          )),
                      Text("روزانه",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(1),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addShift(1);
                                } else {
                                  _controller.shiftSelect.remove(1);
                                }
                              }
                            },
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("شبانه", style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(2),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addShift(2);
                                } else {
                                  _controller.shiftSelect.remove(2);
                                }
                              }
                            },
                          )),
                      Text("مقطعی", style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(3),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addShift(3);
                                } else {
                                  _controller.shiftSelect.remove(3);
                                }
                              }
                            },
                          )),
                      Text("همه موارد",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(4) && _controller.shiftSelect.length==5,
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.addShift(4);
                                } else {
                                  _controller.shiftSelect.clear();
                                }
                              }
                            },
                          )),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(
            width: Get.width,
            height: Get.height / 10,
            child: NextButton(onNext: _controller.createNurse),
          )
          // NextStepButton(title: "مرحله بعدی", onTap: _controller.createNurse)
        ],
      ),
    );
  }
}
