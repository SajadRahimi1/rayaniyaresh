import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/login/validation_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/otp_widget.dart';

class ValidateCodeScreen extends StatelessWidget {
  const ValidateCodeScreen({Key? key, required this.phoneNumber})
      : super(key: key);
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    final ValidateViewModel _controller =
        Get.put(ValidateViewModel(phoneNumber: phoneNumber));

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
            backgroundColor: const Color(0xfffcfcfc),
            elevation: 0.5,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff404040),
              ),
              onPressed: () => Get.back(),
            )),
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: Get.width,
                  height: Get.height / 6,
                  margin: EdgeInsets.symmetric(horizontal: Get.width / 20) +
                      EdgeInsets.only(top: Get.height / 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // text
                        SizedBox(
                          width: Get.width / 1,
                          child: Text(
                            "لطفا کد ارسال شده را وارد کنید",
                            style: TextStyle(
                              color: const Color(0xff404040),
                              fontSize: MediaQuery.of(context).size.width / 28,

                              // fontWeight: FontWei
                            ),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),

                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: SizedBox(
                            width: Get.width / 1.3,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: Get.width / 20),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    4,
                                    (index) => Obx(
                                      () => Otp(
                                        isCorrect: _controller
                                            .correctCode[index].value,
                                        index: index,
                                        controller:
                                            _controller.textControllers[index],
                                        onChanged: (value) {
                                          // if (_controller.inputCode
                                          //         .valueToString()
                                          //         .length ==
                                          //     4) {
                                          //   _controller.filled.value = true;
                                          // }
                                          _controller.inputCode[index] = value;
                                          if (value.isNotEmpty) {
                                            if (index == 3) {
                                              FocusScope.of(context).unfocus();
                                            } else {
                                              FocusScope.of(context)
                                                  .nextFocus();
                                            }
                                          } else {
                                            index != 0
                                                ? FocusScope.of(context)
                                                    .previousFocus()
                                                : {};
                                          }
                                        },
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ),

                        InkWell(
                          onTap: _controller.sendSmsCode,
                          child: Obx(() => Text(
                              _controller.time.value == 0
                                  ? "ارسال مجدد کد"
                                  : "ارسال مجدد کد در : ${_controller.time.value < 60 ? 0 : _controller.time.value ~/ 60}:${_controller.time.value < 60 ? _controller.time.value : _controller.time.value % 60}",
                              style: TextStyle(
                                  color: _controller.time.value == 0
                                      ? Colors.black
                                      : const Color(0xff858585)))),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Get.height / 30),
                  child: InkWell(
                      onTap: _controller.validateSmsCode,
                      child: Container(
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: Get.width / 1.1,
                        height: Get.height / 18,
                        child: const Center(
                          child: Text(
                            "تایید",
                            style: TextStyle(
                                color: Color(0xffffffff), fontSize: 12),
                          ),
                        ),
                      )),
                ),
              ],
            )),
      ),
    );
  }
}
