import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_select_screen.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_uploads_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';
import 'package:rayaniyaresh/views/widgets/yes_no_widget.dart';

class NurseQuestionScreen extends StatelessWidget {
  const NurseQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "استخدام پرستار"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                // drug
                YesNoWidget(
                  value: false,
                  title: "ایا از مواد مخدر استفاده میکنید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                // cigret
                YesNoWidget(
                  value: false,
                  title: "ایا از سبگاز استفاده میکنید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                // alcoholic
                YesNoWidget(
                  value: false,
                  title: "ایا از مشروبات الکلی استفاده میکنید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: false,
                  title: "ایا دارای معلولیت جسمی هستید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                //
                YesNoWidget(
                  value: false,
                  title: "ایا ابیماری خاصی دارید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: false,
                  title: "ایا دارای سابقه حکومت کیفری هستید؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: false,
                  title:
                      "ایا میخواهید در حین فعالیت یک یا چند نفر از اعضای خانواده شما کنارتان حضور داشته باشد؟  ",
                  onChanged: (value) {},
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: false,
                  title: "ایا مدرک تخصصی در زمینه پرستاری و درمانی دارید؟  ",
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                )
              ],
            ),
          ),
          NextStepButton(
            title: "مرحله بعدی",
            onTap: () => Get.to(() => const NurseSelectSreen(),
                transition: Transition.leftToRight),
          )
        ],
      ),
    );
  }
}
