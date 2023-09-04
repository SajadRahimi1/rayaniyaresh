import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
              const Text(
                "\nتصویر عکس پرسنلی\n",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: Obx(() => Container(
                      width: Get.width / 2.5,
                      height: Get.height / 5,
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
                                horizontal: Get.width / 25,
                                vertical: Get.height / 15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.7),
                                border: Border.all(color: Color(0xff000000))),
                            alignment: Alignment.center,
                            child: const Text("انتخاب عکس")),
                      ),
                    )),
              ),

              const Divider(
                thickness: 1,
              ),
              // first page of national
              const Text(
                "\nتصویر صفحه اول شناسنامه\n",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                  child: Obx(
                () => Container(
                  width: Get.width / 1.7,
                  height: Get.height / 4.3,
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
                            horizontal: Get.width / 25,
                            vertical: Get.height / 15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                            border: Border.all(color: const Color(0xff000000))),
                        alignment: Alignment.center,
                        child: const Text("انتخاب عکس")),
                  ),
                ),
              )),

              const Divider(
                thickness: 1,
              ),

              // second page of national
              const Text(
                "\nتصویر صفحه توضیحات شناسنامه(وضعیت تاهل)\n",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                  child: Obx(
                () => Container(
                  width: Get.width / 1.7,
                  height: Get.height / 4.3,
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
                            horizontal: Get.width / 25,
                            vertical: Get.height / 15),
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 0.7),
                            border: Border.all(color: Color(0xff000000))),
                        alignment: Alignment.center,
                        child: const Text("انتخاب عکس")),
                  ),
                ),
              )),

              const Divider(
                thickness: 1,
              ),

              const Text(
                "تصویر رضایت نامه همسر و یا سرپرست خانواده (ویژه بانوان)",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: Obx(() => Container(
                      width: Get.width / 1.5,
                      height: Get.height / 4,
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
                                horizontal: Get.width / 25,
                                vertical: Get.height / 15),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 255, 255, 0.7),
                                border: Border.all(color: Color(0xff000000))),
                            alignment: Alignment.center,
                            child: const Text("انتخاب عکس")),
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
