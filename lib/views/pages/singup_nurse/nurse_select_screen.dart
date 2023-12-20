import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
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
                            value: _controller.categorySelect
                                .contains(NurseCategory.Kid),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.categorySelect
                                      .add(NurseCategory.Kid);
                                } else {
                                  _controller.categorySelect
                                      .remove(NurseCategory.Kid);
                                }
                              }
                            },
                          )),
                      Text("پرستار سالمند",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.categorySelect
                                .contains(NurseCategory.Oldage),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.categorySelect
                                      .add(NurseCategory.Oldage);
                                } else {
                                  _controller.categorySelect
                                      .remove(NurseCategory.Oldage);
                                }
                              }
                            },
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("پرستار بیمار",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.categorySelect
                                .contains(NurseCategory.Patient),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.categorySelect
                                      .add(NurseCategory.Patient);
                                } else {
                                  _controller.categorySelect
                                      .remove(NurseCategory.Patient);
                                }
                              }
                            },
                          )),
                      // Text("همه موارد",
                      //     style: TextStyle(fontSize: Get.width / 30)),
                      // Obx(() => Checkbox(
                      //       activeColor: buttonColor,
                      //       value: _controller.categorySelect
                      //           .contains(NurseCategory.All),
                      //       onChanged: (value) {
                      //         if (value != null) {
                      //           if (value) {
                      //             _controller.categorySelect
                      //                 .add(NurseCategory.All);
                      //           } else {
                      //             _controller.categorySelect
                      //                 .remove(NurseCategory.All);
                      //           }
                      //         }
                      //       },
                      //     )),
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
                            value: _controller.shiftSelect
                                .contains(Shift.Boarding),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.shiftSelect.add(Shift.Boarding);
                                } else {
                                  _controller.shiftSelect
                                      .remove(Shift.Boarding);
                                }
                              }
                            },
                          )),
                      Text("روزانه",
                          style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(Shift.Day),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.shiftSelect.add(Shift.Day);
                                } else {
                                  _controller.shiftSelect.remove(Shift.Day);
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
                            value:
                                _controller.shiftSelect.contains(Shift.Night),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.shiftSelect.add(Shift.Night);
                                } else {
                                  _controller.shiftSelect.remove(Shift.Night);
                                }
                              }
                            },
                          )),
                      Text("مقطعی", style: TextStyle(fontSize: Get.width / 30)),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: _controller.shiftSelect.contains(Shift.Hour),
                            onChanged: (value) {
                              if (value != null) {
                                if (value) {
                                  _controller.shiftSelect.add(Shift.Hour);
                                } else {
                                  _controller.shiftSelect.remove(Shift.Hour);
                                }
                              }
                            },
                          )),
                      // Text("همه موارد",
                      //     style: TextStyle(fontSize: Get.width / 30)),
                      // Obx(() => Checkbox(
                      //       activeColor: buttonColor,
                      //       value: _controller.shiftSelect.contains(4) &&
                      //           _controller.shiftSelect.length == 5,
                      //       onChanged: (value) {
                      //         if (value != null) {
                      //           if (value) {
                      //             _controller.addShift(4);
                      //           } else {
                      //             _controller.shiftSelect.clear();
                      //           }
                      //         }
                      //       },
                      //     )),
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
