import 'package:flutter/gestures.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rayaniyaresh/viewmodels/login/get_phone_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/privacy_screen.dart';
import 'package:rayaniyaresh/views/pages/rules_screen.dart';

class GetPhoneScreen extends StatelessWidget {
  const GetPhoneScreen({Key? key, this.isExit = false}) : super(key: key);
  final bool isExit;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(GetPhoneViewModel(isExit));

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        appBar: AppBar(
          backgroundColor: const Color(0xfffcfcfc),
          elevation: 0.5,
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.arrow_back,
          //     color: const Color(0xff000000),
          //   ),
          //   onPressed: () => Get.back(),
          // ),
        ),
        body: _controller.obx(
            (status) => SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width,
                      height: Get.height / 2.5,
                      margin: EdgeInsets.symmetric(horizontal: Get.width / 20) +
                          EdgeInsets.only(top: Get.height / 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: [
                            // text
                            SizedBox(
                              width: Get.width / 1,
                              child: Text(
                                "شماره تلفن همراه خود را وارد کنید",
                                style: TextStyle(
                                  color: const Color(0xff404040),
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30,

                                  // fontWeight: FontWei
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                            SizedBox(
                              height: Get.height / 45,
                            ),
                            // text input
                            TextField(
                              onChanged: (value) =>
                                  _controller.phoneNumber.value = value,
                              textAlign: TextAlign.end,
                              maxLength: 11,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 25,
                                color: const Color(0xff404040),
                              ),
                              keyboardType: TextInputType.number,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(Icons.phone_android,
                                    color: purple),
                                // suffixIconColor: const Color(0xffb5b5b5),
                                suffixIconColor: purple,
                                counterText: "",
                                alignLabelWithHint: false,
                                hintTextDirection: TextDirection.ltr,
                                hintText: "تلفن همراه",
                                hintStyle: TextStyle(
                                  color: const Color(0xffb5b5b5),
                                  fontSize:
                                      MediaQuery.of(context).size.width / 37,
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffb0b0b0), width: 0.3),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: buttonColor, width: 1),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: Get.height / 30,
                            ),

                            Expanded(
                                // width: Get.width,
                                // height: Get.height / 5,1
                                child: RichText(
                                    textScaleFactor:
                                        MediaQuery.of(context).textScaleFactor,
                                    textAlign: TextAlign.justify,
                                    textDirection: TextDirection.rtl,
                                    softWrap: true,
                                    text: TextSpan(
                                      style: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      children: [
                                        const TextSpan(
                                          text:
                                              "با ورود و یا ثبت نام در آسیاسلامت ",
                                        ),
                                        /*Get.to(
                                            () => const RulesScreen(),
                                            transition: Transition.noTransition),*/
                                        TextSpan(
                                          text: "قوانین و مقررات ",
                                          style: const TextStyle(
                                              color: buttonColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Get.to(
                                                () => const RulesScreen(),
                                                transition:
                                                    Transition.noTransition),
                                        ),
                                        const TextSpan(
                                          text:
                                              "استفاده از پلتفرم آسیاسلامت و همچنین قوانین مربوط به ",
                                        ),
                                        TextSpan(
                                          text: "حریم خصوصی ",
                                          style: const TextStyle(
                                              color: buttonColor),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () => Get.to(
                                                () => const PrivacyScreen(),
                                                transition:
                                                    Transition.noTransition),
                                        ),
                                        const TextSpan(
                                          text: "را می پذیرید.",
                                        )
                                      ],
                                    ))),
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 30),
                      child: InkWell(
                          onTap: () {
                            if (_controller.isPhoneValida.value) {
                              _controller.sendData();
                            } else {
                              showMessage(
                                  title: 'خطا',
                                  message: 'شماره تلفن را به درستی وارد کنید',
                                  type: MessageType.error);
                            }
                          },
                          child: Obx(() => Container(
                                decoration: BoxDecoration(
                                  color: _controller.isPhoneValida.value
                                      ? buttonColor
                                      : const Color(0xffe5e5e5),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: Get.width / 1.1,
                                height: Get.height / 18,
                                child: const Center(
                                  child: Text(
                                    "ورود / ثبت نام",
                                    style: TextStyle(
                                        color: Color(0xffffffff), fontSize: 12),
                                  ),
                                ),
                              ))),
                    ),
                  ],
                )),
            onLoading: const Center(
              child: SpinKitThreeBounce(
                color: buttonColor,
                size: 23.0,
              ),
            )),
      ),
    );
  }
}
