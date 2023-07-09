import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/models/nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/reserve_nurse/show_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/reserve_nurse/nurse_detail_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class ShowNerseScreen extends StatelessWidget {
  const ShowNerseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ShowNurseViewmodel());
    return Scaffold(
        appBar: screensAppbar(context: context, title: "پرستار ها"),
        body: _controller.obx((status) => ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: _controller.nurseModel.length,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (_, index) => NurseWidget(
                model: _controller.nurseModel[index],
                onTap: () => Get.to(
                    () => NurseDetailScreen(
                        nurseModel: _controller.nurseModel[index]),
                    transition: Transition.leftToRight)))));
  }
}
