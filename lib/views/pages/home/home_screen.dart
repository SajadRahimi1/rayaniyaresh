import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/home/home_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/more/reserved_list_screen.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/nurse_category_screen.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/class_category_screen.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_information_screen.dart';
import 'package:rayaniyaresh/views/widgets/banner_slider.dart';
import 'package:rayaniyaresh/views/widgets/service_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, this.onShopTap}) : super(key: key);
  final void Function()? onShopTap;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeViewModel());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: Get.height / 5,
                width: Get.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => const ReservedListScreen()),
                        child: Container(
                            width: Get.width / 2.8,
                            height: Get.height / 24,
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                "درخواست های من",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () => Get.to(() => const ReservedListScreen()),
                        child: Container(
                            width: Get.width / 2.8,
                            height: Get.height / 24,
                            decoration: BoxDecoration(
                                color: buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                "درخواست های استخدام",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 11),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: controller.onMessagesClick,
                        child: Container(
                          width: Get.width / 2.8,
                          height: Get.height / 24,
                          decoration: BoxDecoration(
                              color: buttonColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("پیام های من : ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Get.width / 31)),
                              Obx(() => Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: [
                                        Colors.white,
                                        Colors.red,
                                      ][controller.color.value],
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Obx(() => Text(
                                          controller.messagesLength.value
                                              .toString()
                                              .toPersianDigit(),
                                          style: const TextStyle(
                                              color: buttonColor, fontSize: 12),
                                        )),
                                  ))),
                            ],
                          ),
                        ),
                      ),
                      /*
                      SizedBox(
                        width: Get.width / 2.2,
                        child: Row(
                          children: [
                            Container(
                                // backgroundColor: buttonColor,
                                // radius: Get.width / 40,
                                // duration: const Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    "0".toPersianDigit(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )),
                            Text(" :درخواست های من",
                                style: TextStyle(
                                    color: buttonColor,
                                    fontSize: Get.width / 31)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2.2,
                        child: Row(
                          children: [
                            Container(
                                // backgroundColor: buttonColor,
                                // radius: Get.width / 40,
                                // duration: const Duration(milliseconds: 500),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Center(
                                  child: Text(
                                    "0".toPersianDigit(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                )),
                            Text(" :درخواست های تایید شده",
                                style: TextStyle(
                                    color: buttonColor,
                                    fontSize: Get.width / 31)),
                          ],
                        ),
                      ),
                      SizedBox(
                          width: Get.width / 2.2,
                          child: Row(
                            children: [
                              Container(
                                  // backgroundColor: buttonColor,
                                  // radius: Get.width / 40,
                                  // duration: const Duration(milliseconds: 500),
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Center(
                                    child: Text(
                                      "0".toPersianDigit(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  )),
                              Text(" :درخواست های رد شده",
                                  style: TextStyle(
                                      color: buttonColor,
                                      fontSize: Get.width / 31)),
                            ],
                          )),*/
                    ]),
              ),
              // categories
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 2.5,
                  height: MediaQuery.of(context).size.width / 3.5 * (6 ~/ 2),
                  child: Column(
                    children: [
                      Container(
                        // margin: const EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        height: 3,
                        color: buttonColor,
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => ServiceWidget(
                                  isImageAsset: true,
                                  onTap: () {
                                    FocusScope.of(context).unfocus();
                                    switch (index) {
                                      case 0:
                                        Get.to(
                                            () => const NurseCategoryScreen());
                                        break;
                                      case 1:
                                        Get.to(() =>
                                            const NurseInformationScreen());
                                        break;
                                      case 2:
                                        Get.to(
                                            () => const ClassCategoryScreen());
                                        break;
                                      default:
                                        showMessage(
                                            title: "به زودی",
                                            message:
                                                "این امکان بزودی فعال میشود",
                                            type: MessageType.info);
                                        break;
                                    }
                                  },
                                  image: [
                                    "nurse.png",
                                    "hiring.png",
                                    "learning.png",
                                    "services2.png",
                                    "building.png",
                                    "reserve-class.png",
                                  ][index],
                                  title: [
                                    "خدمات پرستاری",
                                    "استخدام پرستار",
                                    "آموزشگاه",
                                    "خدمات پزشکی (بزودی)",
                                    "اجاره تجهیزات پزشکی(بزودی)",
                                    "فروش تجهیزات پزشکی(بزودی)",
                                    // "فروشی پکیج آموشی",
                                    // "اجاره تجهیزات پزشکی",
                                    // "فروش تجهیزات پزشکی",
                                    // "فروش دوربین مداربسته",
                                  ][index])),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          width: Get.width / 1.5,
                          height: 3,
                          color: buttonColor,
                        ),
                      ),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => ServiceWidget(
                                  isImageAsset: true,
                                  enable: false,
                                  onTap: () {},
                                  image: [
                                    "service3.png",
                                    "rent.png",
                                    "sale.png",
                                  ][index],
                                  title: [
                                    "خدمات پزشکی (بزودی)",
                                    "اجاره تجهیزات پزشکی(بزودی)",
                                    "فروش تجهیزات پزشکی(بزودی)",
                                    // "فروشی پکیج آموشی",
                                    // "اجاره تجهیزات پزشکی",
                                    // "فروش تجهیزات پزشکی",
                                    // "فروش دوربین مداربسته",
                                  ][index])),
                        ),
                      )
                    ],
                  )),
              InkWell(
                // onTap: onShopTap,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: Get.height / 25),
                  width: Get.width,
                  height: Get.height / 4.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: AssetImage("assets/images/images/banner.jpg"),
                          fit: BoxFit.fill)),
                ),
              ),

              // favorites services
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "کلاس های پر طرفدار",
                        style: TextStyle(
                            color: const Color(0xff252525),
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 26),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const BannerSlider(),
                    ))
                  ],
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
