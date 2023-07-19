import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseSelectSreen extends StatelessWidget {
  const NurseSelectSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxInt categorySelect = (3).obs;
    return Scaffold(
      appBar: screensAppbar(context: context),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(children: [
              // child categorySelect
              Text("لطفا گزینه مورد نظر را در خصوص مراقبت انتخاب بفرمایید :"
                  "  "),
              Row(
                children: [
                  const Text("پرستار کودک"),
                  Obx(() => Checkbox(
                        value: categorySelect.value == 0,
                        onChanged: (value) {
                          if (value != null) {
                            categorySelect.value = 0;
                          }
                        },
                      )),
                  const Text("پرستار سالمند"),
                  Obx(() => Checkbox(
                        value: categorySelect.value == 1,
                        onChanged: (value) {
                          if (value != null) {
                            categorySelect.value = 1;
                          }
                        },
                      )),
                  const Text("پرستار بمار"),
                  Obx(() => Checkbox(
                        value: categorySelect.value == 2,
                        onChanged: (value) {
                          if (value != null) {
                            categorySelect.value = 2;
                          }
                        },
                      )),
                  const Text("همه موارد"),
                  Obx(() => Checkbox(
                        value: categorySelect.value == 3,
                        onChanged: (value) {
                          if (value != null) {
                            categorySelect.value = 3;
                          }
                        },
                      )),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
