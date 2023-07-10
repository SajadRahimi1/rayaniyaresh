import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/more/reserved_list_viewModel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class ReservedListScreen extends StatelessWidget {
  const ReservedListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ReservedListViewmodel());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: screensAppbar(context: context),
          body: _controller.obx((status) => Column(children: [
                SizedBox(
                  height: Get.height / 10,
                  child: Center(
                    child: Text(
                      "لیست رزرو ها ",
                      style: TextStyle(
                          fontSize: Get.width / 18,
                          color: const Color(0xff000000)),
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffefefef),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Get.width / 50),
                  height: MediaQuery.of(context).size.height / 13,
                  child: TabBar(
                    indicatorColor: buttonColor,
                    labelColor: buttonColor,
                    unselectedLabelColor: const Color(0xff555555),
                    // unselectedLabelStyle: const TextStyle(
                    //   fontSize: 11,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    // labelStyle: TextStyle(
                    //   fontSize: Get.width / 25,
                    //   fontWeight: FontWeight.bold,
                    // ),
                    tabs: List.generate(
                        2,
                        (index) => Tab(
                              text: ["کلاس ها", "پرستار ها"][index],
                            )),
                  ),
                ),

                // screens
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Container(),
                      ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: _controller.nurseModels.length,
                          itemBuilder: (_, index) => NurseWidget(
                                isReserved: true,
                                model: _controller.nurseModels[index].nurse,
                                days: _controller.nurseModels[index].days
                                        ?.split(',') ??
                                    [],
                              ))
                    ],
                  ),
                )
              ]))),
    );
  }
}
