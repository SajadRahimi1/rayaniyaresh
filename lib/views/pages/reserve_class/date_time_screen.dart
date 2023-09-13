import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/class_model.dart';
import 'package:rayaniyaresh/models/models/reserve_class_model.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/subcategory_datails_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';

class DateTimeScreen extends StatelessWidget {
  const DateTimeScreen({Key? key, required this.title, required this.model})
      : super(key: key);
  final String title;
  final ClassCategories model;
  @override
  Widget build(BuildContext context) {
    var reserveModel = ReserveClassModel();
    RxInt _daysIndex = (0).obs;
    RxInt _hoursIndex = (0).obs;
    model.days = model.days?.where((element) => element.isNotEmpty).toList();

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
                      style: TextStyle(fontSize: Get.width / 26),
                    ),
                  ),
                  // days widgets
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: Get.height / 25,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          model.days?.length ?? 0,
                          (index) => InkWell(
                              onTap: () => _daysIndex.value = index,
                              child: Obx(
                                () => Container(
                                  alignment: Alignment.center,
                                  width: Get.width / 3,
                                  height: Get.height / 12,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: _daysIndex.value == index
                                          ? buttonColor
                                          : const Color(0xffcfcfcf)),
                                  child: Text(
                                    model.days?[index] ?? "",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: Get.width / 27),
                                  ),
                                ),
                              )),
                        )),
                  ),
                ],
              ),
            ),
          ),

          // time select car
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: Get.width,
              height: Get.height / 5,
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
                        style: TextStyle(fontSize: Get.width / 26),
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
                          itemCount: model.hours?.length ?? 0,
                          itemBuilder: (_, index) => InkWell(
                            onTap: () => _hoursIndex.value = index,
                            child: Obx(
                              () => Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),

                                alignment: Alignment.center,
                                width: Get.width / 3,
                                // height: Get.height / 15,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: _hoursIndex.value == index
                                        ? buttonColor
                                        : const Color(0xffcfcfcf)),
                                child: Text(
                                  (model.hours?[index] ?? "").toPersianDigit(),
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

          // button
          Expanded(child: NextButton(
            onNext: () {
              reserveModel.day = model.days?[_daysIndex.value];
              reserveModel.hours = model.hours?[_hoursIndex.value];
              reserveModel.classCategoryId = model.id;
              Get.to(
                  () => SubcategoryDetailScreen(
                        title: title,
                        model: model,
                        reserveModel: reserveModel,
                      ),
                  transition: Transition.leftToRight);
            },
          )
              /*
              child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () {
                reserveModel.day = model.days?[_daysIndex.value];
                reserveModel.hours = model.hours?[_hoursIndex.value];
                reserveModel.classCategoryId = model.id;
                Get.to(
                    () => SubcategoryDetailScreen(
                          title: title,
                          model: model,
                          reserveModel: reserveModel,
                        ),
                    transition: Transition.leftToRight);
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
                  "مرحله بعدی",
                  style: TextStyle(
                      color: const Color(0xffffffff), fontSize: Get.width / 22),
                ),
              ),
            ),
          )*/
              )
        ],
      ),
    );
  }
}
