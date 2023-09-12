import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_rules_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseRulesScreen extends StatelessWidget {
  const NurseRulesScreen({Key? key, required this.model}) : super(key: key);
  final CreateNurseModel model;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NurseRulesViewModel(model.id ?? ""));

    return Scaffold(
      appBar: screensAppbar(context: context, title: "شرایط و قوانین"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  "\n1 - اینجانب متعهد میگردم راس ساعت قید شده در محل کار ورود و خروج داشته باشم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),
                Text(
                  "2 - اینجانب متعهد میگردم خارج از شرایط قرارداد خدمات ارائه ندهم چنانچه در صورت عدم تعهدات شرکت آسیاسلامت مجاز به برخورد قانونی می باشد",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "3 - اینجانب متعهد میگردم درخواست وام ، ضمانت ، حقوق بیشتر از طرف اول قرارداد ( کارفرما ) نداشته باشم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),
                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "4 - اینجانب متعهد میگردم در طول مدت ساعت کاری از محل کار بدون اطلاع به شرکت خارج نشوم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "5 - اینجانب متعهد میگردم در صورت درخواست مرخصی و یا ترک کار ۷۲ ساعت قبل به شرکت و کارفرما اطلاع رسانی نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "6 - اینجانب متعهد میگردم در صورت اتمام قرارداد محل کار را ترک نمایم و بدون قرارداد شرکت در آن مکان ( قرارداد قید شده ) به فعالیت خود ادامه ندهم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "7 - اینجانب متعهد میگردم پیشنهاد تبانی از سمت کارفرما ، شرکت را مطلع نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "8 - اینجانب متعهد میگردم بدون دستور پزشک و طرف اول قرارداد هیچ اقدام خود سرانه ای انجام ندهم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "9 - اینجانب متعهد میگردم در صورت بروز هر مشکلی شرکت را مطلع نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "10 - اینجانب تمام جزئیات فرم ثبت نام را مطالعه نموده و تمام اطلاعات را وارد شده را به صورت واقعیت اعلام نموده.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Text(
                  "11 - اینجانب متعهد میگردم تمام شرایط و قوانین شرکت را انجام دهم در غیر این صورت در برابر شرکت هیچ ادعا و شکایتی نیز نداشته و شرکت میتواند با توجه به سندیات و شواهد موجود نسبت به مدارک ضمانتی اینجانب از طریق مراجع ذیصالح اقدام نماید.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 32),
                ),

                // const Padding(
                //   padding: EdgeInsets.only(top: 10.0),
                //   child: Divider(
                //     thickness: 1,
                //   ),
                // ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 40),
                  child: Row(children: [
                    Obx(() => Checkbox(
                        value: controller.accept.value,
                        activeColor: buttonColor,
                        onChanged: (value) =>
                            controller.accept.value = value ?? false)),
                    const Row(
                      children: [
                        Text(
                          "شرایط را ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "قبول",
                          style: TextStyle(
                              color: buttonColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          " دارم.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ]),
                ),
              ],
            ),
          ),
          Obx(() => NextStepButton(
                title: "تایید نهایی",
                enable: controller.accept.value,
                onTap: () async {
                  if (controller.accept.value) {
                    await controller.sendData();
                  } else {
                    showMessage(
                        title: "خطا",
                        message: 'باید  قوانین را قبول کنید',
                        type: MessageType.warning);
                  }
                },
              ))
        ],
      ),
    );
  }
}
