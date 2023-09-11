import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:rayaniyaresh/models/models/create_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/singup_nurse/nurse_select_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_step_button.dart';
import 'package:rayaniyaresh/views/widgets/yes_no_widget.dart';

class NurseQuestionScreen extends StatelessWidget {
  const NurseQuestionScreen({
    Key? key,
    required this.nurseModel,
  }) : super(key: key);
  final CreateNurseModel nurseModel;

  @override
  Widget build(BuildContext context) {
    List<RxBool> questions = List.generate(8, (index) => false.obs);
    return Scaffold(
      appBar: screensAppbar(context: context, title: "سوابق شخصی"),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                // drug
                Obx(() => YesNoWidget(
                      value: questions[0].value,
                      title: "آیا از مواد مخدر استفاده میکنید؟  ",
                      onChanged: (value) {
                        if (value != null) {
                          questions[0].value = value;
                          if (value) {
                            nurseModel.otherProp =
                                (nurseModel.otherProp ?? "") + ".موادمخدر";
                          } else {
                            nurseModel.otherProp?.replaceAll('.موادمخدر', '');
                          }
                        }
                      },
                    )),
                const Divider(
                  thickness: 1,
                ),

                // cigret
                YesNoWidget(
                  value: questions[1].value,
                  title: "آیا از سیگار استفاده میکنید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[1].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".سیگار";
                      } else {
                        nurseModel.otherProp?.replaceAll('.سیگار', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                // alcoholic
                YesNoWidget(
                  value: questions[2].value,
                  title: "آیا از مشروبات الکلی استفاده میکنید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[2].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".الکلی";
                      } else {
                        nurseModel.otherProp?.replaceAll('.الکلی', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: questions[3].value,
                  title: "آیا دارای معلولیت جسمی هستید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[3].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".معلولیت";
                      } else {
                        nurseModel.otherProp?.replaceAll('.معلولیت', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                //
                YesNoWidget(
                  value: questions[4].value,
                  title: "آیا بیماری خاصی دارید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[4].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".بیماری";
                      } else {
                        nurseModel.otherProp?.replaceAll('.بیماری', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: questions[5].value,
                  title: "آیا دارای سابقه حکومت کیفری هستید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[5].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".کیفری";
                      } else {
                        nurseModel.otherProp?.replaceAll('.کیفری', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: questions[6].value,
                  title:
                      "آیا میخواهید در حین فعالیت یک یا چند نفر از اعضای خانواده شما کنارتان حضور داشته باشد؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[6].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".خانواده";
                      } else {
                        nurseModel.otherProp?.replaceAll('.خانواده', '');
                      }
                    }
                  },
                ),
                const Divider(
                  thickness: 1,
                ),

                YesNoWidget(
                  value: questions[7].value,
                  title: "آیا مدرک تخصصی در زمینه پرستاری و درمانی دارید؟  ",
                  onChanged: (value) {
                    if (value != null) {
                      questions[7].value = value;
                      if (value) {
                        nurseModel.otherProp =
                            (nurseModel.otherProp ?? "") + ".مدرک";
                      } else {
                        nurseModel.otherProp?.replaceAll('.مدرک', '');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                )
              ],
            ),
          ),
          NextStepButton(
            title: "مرحله بعدی",
            onTap: () => Get.to(() => NurseSelectSreen(nurseModel: nurseModel),
                transition: Transition.leftToRight),
          )
        ],
      ),
    );
  }
}
