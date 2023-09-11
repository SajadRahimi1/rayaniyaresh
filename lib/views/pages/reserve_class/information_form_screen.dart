import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/reserve_class_model.dart';
import 'package:rayaniyaresh/viewmodels/reserve_class/information_form_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/payment_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as picker;

class InformationFormScreen extends StatelessWidget {
  const InformationFormScreen(
      {Key? key,
      this.subcategoryId,
      this.isReserving = true,
      this.reserveClassModel})
      : super(key: key);
  final String? subcategoryId;
  final bool isReserving;
  final ReserveClassModel? reserveClassModel;
  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(InformationFormViewModel(
        isReserving: isReserving, reserveClassModel: reserveClassModel));

    return Scaffold(
      appBar: screensAppbar(context: context, title: "اطلاعات شخصی"),
      body: _controller.obx((status) => ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Get.width / 25, vertical: Get.height / 35),
                child: Column(
                  children: [
                    ProfileTextInput(
                      controller: _controller.textEditingController[0],
                      text: "نام و نام خانوادگی:",
                      icon: const Icon(
                        Icons.person,
                        color: buttonColor,
                      ),
                      onChanged: (value) {
                        _controller.userModel?.name = value;
                      },
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[1],
                      text: "نام پدر:",
                      icon: const Icon(
                        Icons.family_restroom,
                        color: buttonColor,
                      ),
                      onChanged: (value) {
                        _controller.userModel?.fatherName = value;
                      },
                    ),
                    ProfileTextInput(
                        text: "تاریخ تولد:",
                        enable: false,
                        controller: _controller.textEditingController[2],
                        ontap: () async {
                          picker.Jalali? picked =
                              await picker.showPersianDatePicker(
                            context: context,
                            initialDate: picker.Jalali.now(),
                            firstDate: picker.Jalali(1330, 8),
                            lastDate: picker.Jalali.now(),
                          );
                          if (picked != null) {
                            // _controller.birthday.value = picked.formatCompactDate();
                            _controller.textEditingController[2].text =
                                picked.formatCompactDate();
                            _controller.userModel?.birthday =
                                picked.formatCompactDate();
                          }
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: buttonColor,
                        )),
                    ProfileTextInput(
                      controller: _controller.textEditingController[3],
                      text: "محل صدور:",
                      icon: const Icon(
                        Icons.location_city,
                        color: buttonColor,
                      ),
                      onChanged: (value) {
                        _controller.userModel?.bornCity = value;
                      },
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[4],
                      text: "کد ملی:",
                      icon: const Icon(
                        Icons.public,
                        color: buttonColor,
                      ),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _controller.userModel?.nationalCode = value;
                      },
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[5],
                      text: "شماره شناسنامه:",
                      icon: const Icon(
                        Icons.public_sharp,
                        color: buttonColor,
                      ),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _controller.userModel?.nationalNumber = value;
                      },
                    ),
                    SizedBox(
                      width: Get.width,
                      height: Get.height / 12,
                      child: Row(
                        children: [
                          const Text("میزان تحصیلات :",
                              style: TextStyle(fontSize: 10)),
                          Expanded(
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 5,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (_, index) => InkWell(
                                        onTap: () =>
                                            _controller.education.value = index,
                                        child: Obx(() => Container(
                                              width: Get.width / 8,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3,
                                                  vertical: Get.height / 70),
                                              height: Get.height,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: _controller.education
                                                              .value ==
                                                          index
                                                      ? buttonColor
                                                      : const Color(
                                                          0xffe5e5e5)),
                                              child: Text(
                                                _controller
                                                    .educationStrings[index],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    fontSize: 9),
                                              ),
                                            )),
                                      )))
                        ],
                      ),
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[6],
                      text: "آدرس محل سکونت:",
                      icon: const Icon(
                        Icons.pin_drop,
                        color: buttonColor,
                      ),
                      onChanged: (value) {
                        _controller.userModel?.address = value;
                      },
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[7],
                      text: "شماره تلفن همراه:",
                      icon: const Icon(
                        Icons.phone_android,
                        color: buttonColor,
                      ),
                      keyboardType: TextInputType.number,
                      enable: false,
                      maxLength: 11,
                      onChanged: (value) {
                        _controller.userModel?.phoneNumber = value;
                      },
                    ),
                    ProfileTextInput(
                      controller: _controller.textEditingController[8],
                      text: "شماره ضروری:",
                      icon: const Icon(
                        Icons.phone,
                        color: buttonColor,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 11,
                      onChanged: (value) {
                        _controller.userModel?.emergancyNumber = value;
                      },
                    ),
                  ],
                ),
              ),
              // button
              InkWell(
                onTap: () async {
                  bool isUpdatedData = await _controller.updateInformation();
                  if (isUpdatedData && subcategoryId != null) {
                    bool isInstallment =
                        await Get.dialog<bool>(const PaymentWidget()) ?? false;
                    await _controller.reserveClass(isInstallment);
                  }
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
                    isReserving ? "مرحله بعدی" : "ثبت اطلاعات",
                    style: TextStyle(
                        color: const Color(0xffffffff),
                        fontSize: Get.width / 26),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
