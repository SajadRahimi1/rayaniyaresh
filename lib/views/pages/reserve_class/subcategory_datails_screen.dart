import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/models/class_model.dart';
import 'package:rayaniyaresh/models/models/reserve_class_model.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/information_form_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';
import 'package:rayaniyaresh/views/widgets/subcategory_cons_widget.dart';

class SubcategoryDetailScreen extends StatelessWidget {
  const SubcategoryDetailScreen(
      {Key? key,
      required this.title,
      required this.model,
      required this.reserveModel})
      : super(key: key);
  final String title;
  final ClassCategories model;
  final ReserveClassModel reserveModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: title),
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 20,
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "جمع کل ساعت آموزشی ${model.totallHours} (عملی و توری)",
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "زمان برگزاری کلاس : ${model.timeHolding}",
          ),
          const ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "ارایه مدرک بین المللی و قابل ترجمه از سازمان فنی و حرفه ای",
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "مبلغ شهریه ${model.price} تومان (نقد و اقساط)",
          ),
          Text(
            "شرایط اقساط",
            style: TextStyle(
                fontSize: MediaQuery.sizeOf(context).width / 26,
                fontWeight: FontWeight.bold),
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "پیش پرداخت: ${model.prePaid} تومان",
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "تعداد قسط ماهانه : ${model.installmentNumber.toString()}",
          ),
          ConsWidget(
            image: "assets/images/icons/checked.png",
            title: "مبلغ قسط ماهانه: ${model.installmentPrice} تومان",
          ),
          Expanded(
            child: NextButton(
              onNext: () => Get.to(
                  () => InformationFormScreen(
                        reserveClassModel: reserveModel,
                        subcategoryId: model.id,
                      ),
                  transition: Transition.leftToRight),
            ),
            /*
              child: Align(
            alignment: Alignment.bottomCenter,
            child: InkWell(
              onTap: () => Get.to(
                  () => InformationFormScreen(
                        reserveClassModel: reserveModel,
                        subcategoryId: model.id,
                      ),
                  transition: Transition.leftToRight),
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
