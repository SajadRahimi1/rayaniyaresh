import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/reserved_model.dart';

class ReservedClass extends StatelessWidget {
  const ReservedClass({
    Key? key,
    this.onTap,
    this.evalation,
    this.model,
  }) : super(key: key);

  final void Function()? onTap;
  final double? evalation;
  final ReservedClasses? model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: evalation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 6,
          child: Row(
            children: [
              // image
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  decoration: BoxDecoration(
                    color: randomColor[Random().nextInt(randomColor.length)],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SizedBox.square(
                    dimension: MediaQuery.of(context).size.width / 3.5,
                    child: Center(
                      child: Text(
                        model?.classCategory?.title == "انجام کمک های اولیه"
                            ? "بهداشت و ایمنی"
                            : "خدمات آموزشی",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: const Color(0xffffffff),
                            fontSize: MediaQuery.of(context).size.width / 26),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 18,
              ),
              // other text
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // name
                      Text(
                        model?.classCategory?.title ?? "",
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 28,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // expertise
                      Text(
                        "قیمت کل: " +
                            (model?.classCategory?.price ?? "") +
                            " تومان",
                        style: TextStyle(
                          color: const Color(0xff0f0f0f),
                          fontSize: MediaQuery.of(context).size.width / 31,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // day and hour
                      SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              2,
                              (index) => Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff62E067)),
                                child: Text(
                                  [model?.day ?? "", model?.hours ?? ""][index],
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 32,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          )),

                      // location text

                      Text(
                        (model?.isInstallment ?? false) ? "قسطی" : "",
                        style: TextStyle(
                          color: const Color(0xff050505),
                          fontSize: MediaQuery.of(context).size.width / 29,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
