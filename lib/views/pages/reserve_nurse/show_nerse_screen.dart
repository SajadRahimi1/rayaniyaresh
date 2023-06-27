import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/reserve_nurse/nurse_detail_screen.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class ShowNerseScreen extends StatelessWidget {
  const ShowNerseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF8FAFB),
          title: const Text(
            "پرستار ها",
            style: TextStyle(color: Color(0xff000000)),
          ),
          centerTitle: true,
          leading: const Icon(Icons.more_vert, color: Color(0xff000000)),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: Color(0xff000000)),
              onPressed: () => Get.back(),
            )
          ],
        ),
        body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (_, index) => NurseWidget(
                  onTap: () => Get.to(() => const NurseDetailScreen(),
                      transition: Transition.rightToLeft),
                )));
  }
}
