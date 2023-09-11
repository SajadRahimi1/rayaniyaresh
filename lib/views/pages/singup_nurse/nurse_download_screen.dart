import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rayaniyaresh/core/services/pdf_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_rules_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseDownloadScreen extends StatelessWidget {
  const NurseDownloadScreen({Key? key, required this.nurseModel})
      : super(key: key);
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "دانلود فایل"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\nفایل های زیر را دانلود کنید:\n",
                  style: TextStyle(fontSize: Get.width / 22),
                ),
                // bad background
                InkWell(
                  onTap: () async {
                    await PdfService().init(
                        name: nurseModel.name ?? "",
                        fatherName: nurseModel.fatherName ?? "",
                        birthday: nurseModel.birthday ?? "",
                        nn: nurseModel.nationalNumber ?? "",
                        nn2: nurseModel.nationalCode ?? "",
                        picture: nurseModel.picture ?? "",
                        formCode: (nurseModel.formCode ?? 6000).toString(),
                        isAddicionForm: false);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 2.2,
                    height: Get.height / 8,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff000000))),
                    child: Text(
                      "سوء پیشینه",
                      style: TextStyle(
                          fontSize: Get.width / 24, color: buttonColor),
                    ),
                  ),
                ),
                Text(
                  "\nپس از دانلود فایل سوءپیشینه ، پرینت آن را بگیرید و به یکی از نزدیکترین دفاتر خدمات قضایی نزدیک محل سکونتتان مراجعه برمایید.\n",
                  style: TextStyle(fontSize: Get.width / 27),
                  textAlign: TextAlign.justify,
                ),
                // addiction
                InkWell(
                  onTap: () async {
                    await PdfService().init(
                        name: nurseModel.name ?? "",
                        fatherName: nurseModel.fatherName ?? "",
                        birthday: nurseModel.birthday ?? "",
                        nn: nurseModel.nationalNumber ?? "",
                        nn2: nurseModel.nationalCode ?? "",
                        picture: nurseModel.picture ?? "",
                        formCode: (nurseModel.formCode ?? 6000).toString(),
                        isAddicionForm: true);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 2.2,
                    height: Get.height / 8,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xff000000))),
                    child: Text(
                      "تست اعتیاد",
                      style: TextStyle(
                          fontSize: Get.width / 24, color: buttonColor),
                    ),
                  ),
                ),
                Text(
                  "\nپس از دانلود فایل تست اعتیاد ، پرینت آن را بگیرید و به یکی از نزدیکترین آزمایشگاه های نزدیک محل سکونتتان مراجعه برمایید.",
                  style: TextStyle(fontSize: Get.width / 27),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          NextStepButton(
            title: "مرحله بعدی",
            onTap: () => Get.to(() => NurseRulesScreen(
                  phoneNumber: nurseModel.phoneNumber ?? "",
                  name: nurseModel.name ?? "",
                )),
          ),
        ],
      ),
    );
  }
}
