import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_guarantee_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class NurseGuaranteeScreen extends StatelessWidget {
  const NurseGuaranteeScreen({Key? key, required this.nurseid})
      : super(key: key);
  final String nurseid;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(NurseGuaranteeViewModel(nurseId: nurseid));

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

              // 3 person
              SizedBox(
                  width: Get.width,
                  height: Get.height / 3,
                  child: Column(
                      children: List.generate(
                    3,
                    (index) => SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          SizedBox(
                            height: Get.height / 9,
                            width: Get.width / 4.5,
                            child: ProfileTextInput(
                              text: "آقا/خانم",
                              onChanged: (value) => _controller
                                  .model.nurseParentModels?[index].name = value,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 10,
                          ),
                          SizedBox(
                            height: Get.height / 9,
                            width: Get.width / 5,
                            child: ProfileTextInput(
                                text: "نسبت",
                                onChanged: (value) => _controller
                                    .model
                                    .nurseParentModels?[index]
                                    .information = value),
                          ),
                          SizedBox(
                            width: Get.width / 10,
                          ),
                          SizedBox(
                            height: Get.height / 9,
                            width: Get.width / 5,
                            child: ProfileTextInput(
                                keyboardType: TextInputType.number,
                                text: "مدت آشنایی",
                                onChanged: (value) => _controller
                                    .model
                                    .nurseParentModels?[index]
                                    .knowingTime = value),
                          ),
                          SizedBox(
                            width: Get.width / 10,
                          ),
                          SizedBox(
                            width: Get.width / 3,
                            height: Get.height / 9,
                            child: ProfileTextInput(
                                keyboardType: TextInputType.number,
                                text: "شماره تماس",
                                onChanged: (value) => _controller
                                    .model
                                    .nurseParentModels?[index]
                                    .phoneNumber = value),
                          ),
                        ],
                      ),
                    ),
                  ))),

              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  text: "شماره تماس همسر",
                  onChanged: (value) =>
                      _controller.model.husbandPhoneNumber = value),
              const SizedBox(
                height: 15,
              ),
              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  text: "شماره تماس فرزند",
                  onChanged: (value) =>
                      _controller.model.childPhoneNumber = value),
              const SizedBox(
                height: 15,
              ),
              ProfileTextInput(
                  keyboardType: TextInputType.number,
                  text: "شماره تماس سرپرست خانواده",
                  onChanged: (value) =>
                      _controller.model.parentPhoneNumber = value),
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
                  Obx(() => Checkbox(
                      value: _controller.guaranteeIndex.value == 0,
                      onChanged: <bool>(value) =>
                          _controller.guaranteeIndex.value = 0))
                ],
              ),
              Row(
                children: [
                  Text(
                    "چک به ارزش 100 میلیون تومان",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Obx(() => Checkbox(
                      value: _controller.guaranteeIndex.value == 1,
                      onChanged: (value) =>
                          _controller.guaranteeIndex.value = 1))
                ],
              ),
              Row(
                children: [
                  Text(
                    "جواز کسب",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Obx(() => Checkbox(
                      value: _controller.guaranteeIndex.value == 2,
                      onChanged: <bool>(value) =>
                          _controller.guaranteeIndex.value = 2))
                ],
              ),
              Row(
                children: [
                  Text(
                    "معرف (کارمند دولتی)",
                    style: TextStyle(fontSize: Get.width / 25),
                  ),
                  Obx(() => Checkbox(
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
        NextStepButton(title: "مرحله بعدی", onTap: _controller.sendData)
      ]),
    );
  }
}
