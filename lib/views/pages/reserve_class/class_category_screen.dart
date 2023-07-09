import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/class_services.dart';
import 'package:rayaniyaresh/viewmodels/reserve_class/class_category_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_subcategory_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/class_category_widget.dart';

class ClassCategoryScreen extends StatelessWidget {
  const ClassCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ClassCategoryViewModel());
    return Scaffold(
      appBar: screensAppbar(context: context),
      body: _controller.obx((state) => GridView.count(
            physics: const BouncingScrollPhysics(),
            crossAxisSpacing: Get.width / 28,
            padding: const EdgeInsets.symmetric(horizontal: 10) +
                const EdgeInsets.only(top: 8),
            crossAxisCount: 2,
            childAspectRatio: .7,
            mainAxisSpacing: 13,
            children: List.generate(
                _controller.classModel.length,
                (index) => ClassCategoryWidget(
                      enable: index == 0 || index == 1,
                      onTap: () {
                        if (index == 0 || index == 1) {
                          Get.to(() => ClassSubcategoryScreen(
                              model: _controller.classModel[index].classCategories??[],
                              title: _controller.classModel[index].title??"",
                              ));
                        } else {
                          showMessage(
                              title: "امکان انتخاب وجود ندارد",
                              message: "بزودی این موارد اضافه میشود",
                              type: MessageType.warning);
                        }
                      },
                      title: _controller.classModel[index].title,
                      image: _controller.classModel[index].imageName,
                    )),
          )),
    );
  }
}
