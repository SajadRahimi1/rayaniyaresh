import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/core/services/signin_nurse/create_nurse_service.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/success_reserve_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseRulesScreen extends StatelessWidget {
  const NurseRulesScreen(
      {Key? key, required this.phoneNumber, required this.name})
      : super(key: key);
  final String phoneNumber, name;

  @override
  Widget build(BuildContext context) {
    RxBool accept = false.obs;
    return Scaffold(
      appBar: screensAppbar(context: context, title: "شرایط و قوانین"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  "\nاینجانب متعد میگردم راس ساعت قید شده در محل کار ورود و خروج داشته باشم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم خارج از شرایط قرارداد خدمات ارائه ندهم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم درخواست وام ، ضمانت ، حقوق بیشتر از طرف اول قرارداد ( کارفرما ) نداشته باشم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم در طول مدت ساعت کاری از محل کار بدون اطالع به شرکت خارج نشوم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم در صورت درخواست مرخصی و یا ترک کار ۷۲ ساعت قبل به شرکت و کارفرما اطالع رسانی نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم در صورت اتمام قرارداد محل کار را ترک نمایم و بدون قرارداد شرکت در آن مکان ) قرارداد قید شده ( به فعالیت خود ادامه ندهم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم پیشنهاد تبانی از سمت کارفرما ، شرکت را مطلع نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم بدون دستور پزشک هیچ اقدام خود سرانه ای انجام ندهم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم در صورت بروز هر مشکلی شرکت را مطلع نمایم.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب تمام جزئیات فرم ثبت نام را مطالعه نموده و تمام اطالعات را وارد شده را به صورت واقعیت اعالم نموده.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Text(
                  "\nاینجانب متعهد میگردم تمام شرایط و قوانین شرکت را انجام دهم در غیر این صورت در برابر شرکت هیچ ادعا و شکایتی نیز نداشته و شرکت میتواند با توجه به سندیات و شواهد موجود نسبت به مدارک ضمانتی اینجانب از طریق مراجع ذیصالح اقدام نماید.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: Get.width / 24),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Divider(
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 40),
                  child: Row(children: [
                    Obx(() => Checkbox(
                        value: accept.value,
                        onChanged: (value) => accept.value = value ?? false)),
                    Text(
                      "شرایط را قبول دارم.",
                      style: TextStyle(fontSize: Get.width / 24),
                    )
                  ]),
                ),
              ],
            ),
          ),
          Obx(() => NextStepButton(
                title: "تایید نهایی",
                enable: accept.value,
                onTap: () async {
                  var request = await finalize(phoneNumber, name);
                  print(request.statusCode);
                  if (accept.value) {
                    Get.to(() => const SuccessReserveScreen(
                          message:
                              "تایید نهایی از طریق پیامک به شما اطلاع رسانی خواهد شد",
                        ));
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
