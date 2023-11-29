import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/pdf_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_pdf_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_rules_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';

class NurseDownloadScreen extends StatelessWidget {
  const NurseDownloadScreen({Key? key, required this.nurseModel})
      : super(key: key);
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NursePdfViewModel(nurseModel));
    return Scaffold(
      appBar: screensAppbar(context: context, title: "دانلود فایل"),
      body: controller.obx((status) => Column(
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
                        );
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
                      onTap: () async {},
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
              SizedBox(
            width: Get.width,
            height: Get.height / 10,
            child: NextButton(
              onNext:  () => Get.to(() => NurseRulesScreen(
                      model: nurseModel,
                    )
            )),
          )
              /*NextStepButton(
                title: "مرحله بعدی",
                onTap: () => Get.to(() => NurseRulesScreen(
                      model: nurseModel,
                    )),
              ),*/
            ],
          )),
    );
  }
}
