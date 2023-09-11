import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_uploads_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseUploadsScreen extends StatelessWidget {
  const NurseUploadsScreen({Key? key, required this.nurseId}) : super(key: key);
  final String nurseId;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(NurseUploadsViewModel(id: nurseId));

    return Scaffold(
      appBar: screensAppbar(context: context),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // image
              Text(
                "\nتصویر عکس پرسنلی :",
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 30),
              ),
              Center(
                child: Obx(() => Container(
                      width: Get.width / 2.5,
                      height: Get.height / 6.5,
                      decoration: BoxDecoration(
                          image: _controller.imagePaths[0].value.isEmpty
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                      File(_controller.imagePaths[0].value)))),
                      child: InkWell(
                        onTap: () => _controller.selectImage(0),
                        child: Container(
                            width: Get.width,
                            height: Get.height,
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 25, vertical: 15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.7),
                                border:
                                    Border.all(color: const Color(0xff000000))),
                            alignment: Alignment.center,
                            child: const Text(
                              "انتخاب عکس",
                              style: TextStyle(
                                  color: buttonColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )),
              ),

              Center(
                child: Container(
                  width: Get.width / 1.5,
                  height: 3,
                  color: buttonColor,
                ),
              ),
              // first page of national
              Text(
                "\nتصویر صفحه اول شناسنامه :",
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 30),
              ),
              Center(
                  child: Obx(
                () => Container(
                  width: Get.width / 2.5,
                  height: Get.height / 6.5,
                  decoration: BoxDecoration(
                      image: _controller.imagePaths[1].value.isEmpty
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                  File(_controller.imagePaths[1].value)))),
                  child: InkWell(
                    onTap: () => _controller.selectImage(1),
                    child: Container(
                        width: Get.width,
                        height: Get.height,
                        margin: EdgeInsets.symmetric(
                            horizontal: Get.width / 25, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                            border: Border.all(color: const Color(0xff000000))),
                        alignment: Alignment.center,
                        child: const Text(
                          "انتخاب عکس",
                          style: TextStyle(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              )),

              Center(
                child: Container(
                  width: Get.width / 1.5,
                  height: 3,
                  color: buttonColor,
                ),
              ),

              // second page of national
              Text(
                "\nتصویر صفحه توضیحات شناسنامه : (وضعیت تاهل)",
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 30),
              ),
              Center(
                  child: Obx(
                () => Container(
                  width: Get.width / 2.5,
                  height: Get.height / 6.5,
                  decoration: BoxDecoration(
                      image: _controller.imagePaths[2].value.isEmpty
                          ? null
                          : DecorationImage(
                              image: FileImage(
                                  File(_controller.imagePaths[2].value)))),
                  child: InkWell(
                    onTap: () => _controller.selectImage(2),
                    child: Container(
                        width: Get.width,
                        height: Get.height,
                        margin: EdgeInsets.symmetric(
                            horizontal: Get.width / 25, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                            border: Border.all(color: const Color(0xff000000))),
                        alignment: Alignment.center,
                        child: const Text(
                          "انتخاب عکس",
                          style: TextStyle(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        )),
                  ),
                ),
              )),

              Center(
                child: Container(
                  width: Get.width / 1.5,
                  height: 3,
                  color: buttonColor,
                ),
              ),

              Text(
                "\nتصویر رضایت نامه همسر و یا سرپرست خانواده : (ویژه بانوان)",
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 30),
              ),
              Center(
                child: Obx(() => Container(
                      width: Get.width / 2.5,
                      height: Get.height / 6.5,
                      decoration: BoxDecoration(
                          image: _controller.imagePaths[3].value.isEmpty
                              ? null
                              : DecorationImage(
                                  image: FileImage(
                                      File(_controller.imagePaths[3].value)))),
                      child: InkWell(
                        onTap: () => _controller.selectImage(3),
                        child: Container(
                            width: Get.width,
                            height: Get.height,
                            margin: EdgeInsets.symmetric(
                                horizontal: Get.width / 25, vertical: 15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.7),
                                border:
                                    Border.all(color: const Color(0xff000000))),
                            alignment: Alignment.center,
                            child: const Text(
                              "انتخاب عکس",
                              style: TextStyle(
                                  color: buttonColor,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    )),
              ),

              SizedBox(
                height: Get.height / 20,
              ),
            ]),
          ),
          NextStepButton(title: "مرحله بعدی", onTap: _controller.uploadImages)
        ],
      ),
    );
  }
}
