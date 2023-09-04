import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rayaniyaresh/viewmodels/login/get_phone_viewmodel.dart';

class GetPhoneScreen extends StatefulWidget {
  const GetPhoneScreen({Key? key, this.isExit = false}) : super(key: key);
  final bool isExit;  

  @override
  State<GetPhoneScreen> createState() => _GetPhoneScreenState();
}

class _GetPhoneScreenState extends State<GetPhoneScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Init Get Phone Screen");
  }

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(GetPhoneViewModel());
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
                      height: Get.height / 7,
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
                                      MediaQuery.of(context).size.width / 28,

                                  // fontWeight: FontWei
                                ),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
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
                                    MediaQuery.of(context).size.width / 23,
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
                                      MediaQuery.of(context).size.width / 35,
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
                          ]),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Get.height / 30),
                      child: InkWell(
                          onTap: _controller.sendData,
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
