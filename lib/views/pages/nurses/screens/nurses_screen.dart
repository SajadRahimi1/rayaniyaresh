import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/viewmodels/nurses/nurses_view_model.dart';
import 'package:rayaniyaresh/views/pages/nurses/screens/nurse_information_screen.dart';
import 'package:rayaniyaresh/views/pages/nurses/widgets/nurses_widget.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseScreen extends StatelessWidget {
  const NurseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NursesViewModel());
    return Scaffold(
      appBar: screensAppbar(context: context),
      body: controller.obx((state) => ListView.builder(
            itemCount: controller.nursesModel.length,
            itemBuilder: (_, index) => NursesWidget(
              model: controller.nursesModel[index],
              onTap: () => Get.to(() => NurseInformationScreen(
                    id: controller.nursesModel[index].id ?? '',
                  )),
            ),
          )),
    );
  }
}
