import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/models/nurse_model.dart';
import 'package:rayaniyaresh/viewmodels/reserve_nurse/reserve_nurse_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class NurseDetailScreen extends StatelessWidget {
  const NurseDetailScreen({Key? key, required this.nurseModel})
      : super(key: key);
  final NurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    final _controller =
        Get.put(ReserveNurseViewModel(nurseId: nurseModel.id ?? ""));

    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: screensAppbar(context: context, title: "جزییات پرستار"),
      body: Column(
        children: [
          // all item except button
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height / 25,
                    ),
                    child: NurseWidget(
                      evalation: 0,
                      model: nurseModel,
                    )),

                Text(
                  "درباره",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 27,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  nurseModel.about ?? "",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: const Color(0xffa0a0a0),
                    fontSize: MediaQuery.of(context).size.width / 28,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                // days
                Padding(
                    padding: EdgeInsets.symmetric(vertical: Get.height / 20),
                    child: SizedBox(
                      width: Get.width,
                      height: Get.height / 9,
                      child: ListView.builder(
                        itemCount: nurseModel.days?.length ?? 0,
                        itemExtent: Get.width / 5,
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => _controller.daysSelected[index] =
                              !_controller.daysSelected[index],
                          child: Obx(() => Container(
                                // width: MediaQuery.of(
                                //             context)
                                //         .size
                                //         .width /
                                //     5,
                                height: MediaQuery.of(context).size.height,
                                margin: const EdgeInsets.only(left: 5),
                                decoration: BoxDecoration(
                                  color: _controller.daysSelected[index]
                                      ? const Color(0xff62E067)
                                      : const Color(0xffF5F5F5),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                child: Center(
                                    child: Text(
                                  nurseModel.days?[index],
                                  // "\t" +
                                  //     [index] +
                                  //     "\t",
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              32),
                                )),
                              )),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          // button
          InkWell(
            onTap: _controller.reserveNurse,
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height / 13.5,
              decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Text(
                "رزرو پرستار",
                style: TextStyle(
                    fontSize: Get.width / 24,
                    color:const Color(0xffffffff),
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
