import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/reserve_nurse/request_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class FinalStepScreen extends StatelessWidget {
  const FinalStepScreen({Key? key, required this.model}) : super(key: key);

  final RequestNurseModel model;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(RequestNurseViewmodel(model: model));

    return Scaffold(
      appBar: screensAppbar(context: context, title: "پرستار کودک"),
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(
              text: "نام و نام خانوادگی",
              controller: _controller.textEditingControllers[0],
            )),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(
                text: "شماره تماس",
                keyboardType: TextInputType.number,
                controller: _controller.textEditingControllers[1])),
        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: ProfileTextInput(text: "نحوه آشنایی با ما")),

        // button
        const Expanded(child: SizedBox()),
        InkWell(
          onTap: () async {
            FocusNode().unfocus();
            await _controller.sendData();
          },
          child: Container(
            width: Get.width,
            height: Get.height / 13,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: buttonColor),
            child: Text(
              "ثبت نهایی",
              style: TextStyle(
                  color: const Color(0xffffffff), fontSize: Get.width / 26),
            ),
          ),
        ),
      ]),
    );
  }
}
