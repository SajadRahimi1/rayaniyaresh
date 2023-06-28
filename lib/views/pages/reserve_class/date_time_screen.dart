import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    RxInt _days = (-1).obs;
    RxInt _hoursIndex = (-1).obs;
    return Scaffold(
      appBar: screensAppbar(context: context, title: title),
      body: Column(
        children: [
          // day select card
          Padding(
            padding: const EdgeInsets.all(8.0) +
                EdgeInsets.only(top: Get.height / 35),
            child: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "روزهای خود را انتخاب کنید",
                      style: TextStyle(fontSize: Get.width / 25),
                    ),
                  ),
                  // days widgets
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Get.height / 25,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () => _days.value = 0,
                          child: Obx(
                            () => Container(
                              alignment: Alignment.center,
                              width: Get.width / 2.6,
                              height: Get.height / 8,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: _days.value == 0
                                      ? Colors.green
                                      : const Color(0xffcfcfcf)),
                              child: Text(
                                "روزهای فرد",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: Get.width / 24),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => _days.value = 1,
                          child: Obx(() => Container(
                                alignment: Alignment.center,
                                width: Get.width / 2.6,
                                height: Get.height / 8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _days.value == 1
                                        ? Colors.green
                                        : const Color(0xffcfcfcf)),
                                child: Text(
                                  "روزهای زوج",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: Get.width / 24),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // time select car
          Padding(
            padding: const EdgeInsets.all(8.0) +
                EdgeInsets.only(top: Get.height / 35),
            child: SizedBox(
              width: Get.width,
              height: Get.height / 4,
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "ساعت خود را انتخاب کنید",
                        style: TextStyle(fontSize: Get.width / 25),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: Get.height / 25,
                        ),
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 1,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () => _hoursIndex.value = index,
                            child: Obx(
                              () => Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                alignment: Alignment.center,
                                width: Get.width / 2.8,
                                height: Get.height / 9.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _hoursIndex.value == index
                                        ? Colors.green
                                        : const Color(0xffcfcfcf)),
                                child: Text(
                                  "ساعت 17 الی 21",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: Get.width / 24),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
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
                "مرحله بعدی",
                style: TextStyle(
                    color: Color(0xffffffff), fontSize: Get.width / 22),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
