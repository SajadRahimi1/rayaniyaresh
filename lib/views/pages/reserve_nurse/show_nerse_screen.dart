import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/reserve_nurse/nurse_detail_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class ShowNerseScreen extends StatelessWidget {
  const ShowNerseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: screensAppbar(context: context, title: "پرستار ها"),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (_, index) => NurseWidget(
                onTap: () => Get.to(() => const NurseDetailScreen(),
                    transition: Transition.leftToRight))));
  }
}
