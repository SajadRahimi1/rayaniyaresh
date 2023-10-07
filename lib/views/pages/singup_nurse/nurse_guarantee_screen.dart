import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_guarantee_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class NurseGuaranteeScreen extends StatelessWidget {
  const NurseGuaranteeScreen(
      {Key? key, required this.nurseid, required this.nurseModel})
      : super(key: key);
  final String nurseid;
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(
        NurseGuaranteeViewModel(nurseId: nurseid, nurseModel: nurseModel));

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
                "\nلطفا 3 نفر را معرفی بفرمایید که شما را میشناسد:\n"
                    .toPersianDigit(),
                style: TextStyle(fontSize: Get.width / 26),
              ),
              /* SizedBox(
                            width: Get.width / 3,
                            //height: Get.height / 9,
                            child: ProfileTextInput(
                                keyboardType: TextInputType.number,
                                text: "شماره تماس",
                                onChanged: (value) => _controller
                                    .model
                                    .nurseParentModels?[index]
                                    .phoneNumber = value),
                          ),*/

              // 3 person
              SizedBox(
                  width: Get.width,
                  // height: Get.height / ,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              // //height: Get.height / 9,
                              width: Get.width / 4.5,
                              child: ProfileTextInput(
                                text: "آقا/خانم",
                                onChanged: (value) => _controller
                                    .model.nurseParentModels?[0].name = value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 5,
                              child: ProfileTextInput(
                                  text: "نسبت",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[0]
                                      .information = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 3.4,
                              child: ProfileTextInput(
                                  keyboardType: TextInputType.number,
                                  text: "مدت آشنایی",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[0]
                                      .knowingTime = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ProfileTextInput(
                            keyboardType: TextInputType.number,
                            maxLength: 11,
                            text: "شماره تماس",
                            onChanged: (value) => _controller.model
                                .nurseParentModels?[0].phoneNumber = value),
                      ),
                      Container(
                        width: Get.width,
                        height: 3,
                        color: buttonColor,
                      ),

                      // second
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 4.5,
                              child: ProfileTextInput(
                                text: "آقا/خانم",
                                onChanged: (value) => _controller
                                    .model.nurseParentModels?[1].name = value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 5,
                              child: ProfileTextInput(
                                  text: "نسبت",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[1]
                                      .information = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 5,
                              child: ProfileTextInput(
                                  keyboardType: TextInputType.number,
                                  text: "مدت آشنایی",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[1]
                                      .knowingTime = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ProfileTextInput(
                            keyboardType: TextInputType.number,
                            text: "شماره تماس",
                            maxLength: 11,
                            onChanged: (value) => _controller.model
                                .nurseParentModels?[1].phoneNumber = value),
                      ),
                      Container(
                        width: Get.width,
                        height: 3,
                        color: buttonColor,
                      ),
                      // third
                      SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 4.5,
                              child: ProfileTextInput(
                                text: "آقا/خانم",
                                onChanged: (value) => _controller
                                    .model.nurseParentModels?[2].name = value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 5,
                              child: ProfileTextInput(
                                  text: "نسبت",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[2]
                                      .information = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                            SizedBox(
                              //height: Get.height / 9,
                              width: Get.width / 5,
                              child: ProfileTextInput(
                                  keyboardType: TextInputType.number,
                                  text: "مدت آشنایی",
                                  onChanged: (value) => _controller
                                      .model
                                      .nurseParentModels?[2]
                                      .knowingTime = value),
                            ),
                            SizedBox(
                              width: Get.width / 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: ProfileTextInput(
                            keyboardType: TextInputType.number,
                            maxLength: 11,
                            text: "شماره تماس",
                            onChanged: (value) => _controller.model
                                .nurseParentModels?[2].phoneNumber = value),
                      ),
                    ],
                  )),
              Container(
                width: Get.width,
                height: 3,
                color: buttonColor,
              ),

              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  text: "شماره تماس همسر :",
                  onChanged: (value) =>
                      _controller.model.husbandPhoneNumber = value),
              const SizedBox(
                height: 15,
              ),
              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  text: "شماره تماس فرزند :",
                  onChanged: (value) =>
                      _controller.model.childPhoneNumber = value),
              const SizedBox(
                height: 15,
              ),
              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  text: "شماره تماس سرپرست خانواده :",
                  onChanged: (value) =>
                      _controller.model.parentPhoneNumber = value),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: Get.width,
                height: 3,
                color: buttonColor,
              ),
              Text(
                "\nدر صورت مشغول به کار شدن کدام یک از موارد را جهت ضمانت میتوانید نزد شرکت قرار دهید؟\n",
                style: TextStyle(fontSize: Get.width / 27),
              ),
              Row(
                children: [
                  Text(
                    "سفته (به مبلغ 50 میلیون تومان)",
                    style: TextStyle(fontSize: Get.width / 28),
                  ),
                  Obx(() => Checkbox(
                      activeColor: buttonColor,
                      value: _controller.guaranteeIndex.value == 0,
                      onChanged: <bool>(value) =>
                          _controller.guaranteeIndex.value = 0))
                ],
              ),
              Row(
                children: [
                  Text(
                    "چک به ارزش 100 میلیون تومان",
                    style: TextStyle(fontSize: Get.width / 28),
                  ),
                  Obx(() => Checkbox(
                      value: _controller.guaranteeIndex.value == 1,
                      activeColor: buttonColor,
                      onChanged: (value) =>
                          _controller.guaranteeIndex.value = 1))
                ],
              ),
              Row(
                children: [
                  Text(
                    "جواز کسب",
                    style: TextStyle(fontSize: Get.width / 28),
                  ),
                  Obx(() => Checkbox(
                      activeColor: buttonColor,
                      value: _controller.guaranteeIndex.value == 2,
                      onChanged: <bool>(value) =>
                          _controller.guaranteeIndex.value = 2))
                ],
              ),
              Row(
                children: [
                  Text(
                    "معرف (کارمند دولتی)",
                    style: TextStyle(fontSize: Get.width / 28),
                  ),
                  Obx(() => Checkbox(
                      activeColor: buttonColor,
                      value: _controller.guaranteeIndex.value == 3,
                      onChanged: <bool>(value) =>
                          _controller.guaranteeIndex.value = 3))
                ],
              ),
              SizedBox(
                height: Get.height / 20,
              )
            ],
          ),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height / 10,
          child: NextButton(onNext: _controller.sendData),
        )
        // NextStepButton(title: "مرحله بعدی", onTap: _controller.sendData)
      ]),
    );
  }
}
