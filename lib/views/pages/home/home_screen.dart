import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: Get.height / 35),
                width: Get.width,
                height: Get.height / 4.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/images/images/banner.jpg"),
                        fit: BoxFit.fill)),
              ),
              // categories
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height / 2.5,
                  height: MediaQuery.of(context).size.width / 3.5 * (6 ~/ 2),
                  child: Column(
                    children: [
                      /* Container(
                        // margin: const EdgeInsets.symmetric(vertical: 15),
                        width: Get.width,
                        height: 3,
                        color: buttonColor,
                      ),*/
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
                                    "درخواست پرستار",
                                    "استخدام غیرحضوری",
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
              /*InkWell(
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
              ),*/

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
