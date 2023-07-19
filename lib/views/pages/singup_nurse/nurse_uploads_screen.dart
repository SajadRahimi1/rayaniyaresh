import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';

class NurseUploadsScreen extends StatelessWidget {
  const NurseUploadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                child: Container(
                  width: Get.width / 2.5,
                  height: Get.height / 5,
                  color: Colors.cyan,
                ),
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
                child: Container(
                  width: Get.width / 1.7,
                  height: Get.height / 4.3,
                  color: Colors.cyan,
                ),
              ),

              const Divider(
                thickness: 1,
              ),

              // second page of national
              const Text(
                "\nتصویر صفحه توضیحات شناسنامه(وضعیت تاهل)\n",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: Container(
                  width: Get.width / 1.7,
                  height: Get.height / 4.3,
                  color: Colors.cyan,
                ),
              ),

              const Divider(
                thickness: 1,
              ),

              const Text(
                "تصویر رضایت نامه همسر و یا سرپرست خانواده (ویژه بانوان)",
                style: TextStyle(fontSize: 16),
              ),
              Center(
                child: Container(
                  width: Get.width / 1.5,
                  height: Get.height / 4,
                  color: Colors.cyan,
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              ),
            ]),
          ),
          NextStepButton(title: "مرحله بعدی")
        ],
      ),
    );
  }
}
