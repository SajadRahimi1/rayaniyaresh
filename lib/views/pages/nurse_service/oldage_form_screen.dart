import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/validations/baby_sitter_validation.dart';
import 'package:rayaniyaresh/models/constants/city_constant.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/final_step_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class OldageFormScreen extends StatefulWidget {
  const OldageFormScreen({Key? key}) : super(key: key);

  @override
  State<OldageFormScreen> createState() => _OldageFormScreen();
}

class _OldageFormScreen extends State<OldageFormScreen> {
  RxInt gender = (-1).obs;
  RxInt childNumber = (1).obs;
  RxList<int> oldageProblem = [1].obs;
  RxInt shiftWork = (-1).obs;
  RxBool camera = false.obs;
  List<int?> ages = List.generate(4, (index) => null);
  String province = "", city = "", neighbourhood = "", hours1 = "", hours2 = "";
  final RequestNurseModel model = RequestNurseModel();

  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final FocusNode cityFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.cctv = camera.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: screensAppbar(context: context, title: "پرستار سالمند"),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10) +
                const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                // child number
                Row(
                  children: [
                    Text(
                      "تعداد سالمند: " "   ",
                      style: TextStyle(fontSize: Get.width / 30),
                    ),
                    Obx(() => DropdownButton(
                        items: List.generate(
                            4,
                            (index) => DropdownMenuItem<int>(
                                  child: Text(
                                    (index + 1).toString(),
                                  ),
                                  value: index + 1,
                                )),
                        value: childNumber.value,
                        elevation: 5,
                        // style: TextStyle(fontSize: Get.width / 23),
                        onChanged: <int>(value) => childNumber.value = value)),
                  ],
                ),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // child gender
                Row(
                  children: [
                    Text(
                      "جنسیت:" "  ",
                      style: TextStyle(fontSize: Get.width / 30),
                    ),
                    Text(
                      "مرد",
                      style: TextStyle(fontSize: Get.width / 30),
                    ),
                    Obx(() => Checkbox(
                          activeColor: buttonColor,
                          value: gender.value == 0 || gender.value == 2,
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 0;
                              model.gender = Gender.Male;
                            }
                          },
                        )),
                    Text(
                      "زن",
                      style: TextStyle(fontSize: Get.width / 30),
                    ),
                    Obx(() => Checkbox(
                          activeColor: buttonColor,
                          value: gender.value == 1 || gender.value == 2,
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 1;
                              model.gender = Gender.Female;
                            }
                          },
                        )),
                    Text(
                      "هر دو",
                      style: TextStyle(fontSize: Get.width / 30),
                    ),
                    Obx(() => Checkbox(
                          value: gender.value == 2,
                          activeColor: buttonColor,
                          onChanged: (value) {
                            if (value != null) {
                              if (value) {
                                gender.value = 2;
                              } else {
                                gender.value = -1;
                              }
                              model.gender = Gender.Both;
                            }
                          },
                        )),
                  ],
                ),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // children ages
                Obx(
                  () => SizedBox(
                      width: Get.width,
                      height: Get.height / (childNumber < 3 ? 10 : 6),
                      child: GridView.builder(
                        itemCount: childNumber.value,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: Get.width / 5,
                            childAspectRatio: 2.5,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2),
                        itemBuilder: (_, index) => ProfileTextInput(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          text: "سن سالمند ${index + 1}",
                          onChanged: (value) => value.isEmpty
                              ? {}
                              : ages[index] = int.parse(value),
                        ),
                      )),
                ),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                SizedBox(
                  width: Get.width,
                  child: Text(
                    "سالمند شما کدام یک از موارد زیر را دارا میباشد؟\n",
                    style: TextStyle(fontSize: Get.width / 30),
                  ),
                ),
                Obx(() => SizedBox(
                    width: Get.width,
                    height: Get.height / 7.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => InkWell(
                                    // onTap: () => oldageProblem.value = index,
                                    child: Row(
                                      children: [
                                        Text(
                                          [
                                            "پوشک",
                                            "لگن",
                                            "آلزایمر",
                                          ][index],
                                          style: TextStyle(
                                              fontSize: Get.width / 30),
                                        ),
                                        Checkbox(
                                            value:
                                                oldageProblem.contains(index),
                                            activeColor: buttonColor,
                                            onChanged: (value) {
                                              if (value != null) {
                                                if (value) {
                                                  oldageProblem.add(index);
                                                  oldageProblem.remove(6);
                                                }
                                              } else {
                                                oldageProblem.remove(index);
                                              }
                                            })
                                      ],
                                    ),
                                  )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                              3,
                              (index) => InkWell(
                                    // onTap: () =>
                                    //     oldageProblem.value = index + 4,
                                    child: Row(
                                      children: [
                                        Text(
                                          [
                                            "پارکینسون",
                                            "ام اس",
                                            "هیچ کدام"
                                          ][index],
                                          style: TextStyle(
                                              fontSize: Get.width / 30),
                                        ),
                                        Checkbox(
                                            activeColor: buttonColor,
                                            value: oldageProblem
                                                .contains(index + 4),
                                            onChanged: (value) {
                                              if (value != null) {
                                                if (value) {
                                                  if (index == 2) {
                                                    oldageProblem.value = [];
                                                    oldageProblem
                                                        .add(index + 4);
                                                    return;
                                                  }
                                                  oldageProblem.add(index + 4);
                                                  oldageProblem.remove(6);
                                                } else {
                                                  oldageProblem
                                                      .remove(index + 4);
                                                }
                                              }
                                            })
                                      ],
                                    ),
                                  )),
                        )
                      ],
                    ))),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // shift
                SizedBox(
                  height: Get.height / 30,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(
                        "شیفت کاری:" "  ",
                        style: TextStyle(fontSize: Get.width / 28),
                      ),
                      Text(
                        "شبانه روزی",
                        style: TextStyle(fontSize: Get.width / 28),
                      ),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: shiftWork.value == 0,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 0;
                                model.shift = Shift.Boarding;
                              }
                            },
                          )),
                      Text(
                        "روزانه",
                        style: TextStyle(fontSize: Get.width / 28),
                      ),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: shiftWork.value == 1,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 1;
                                model.shift = Shift.Day;
                              }
                            },
                          )),
                      Text(
                        "شبانه",
                        style: TextStyle(fontSize: Get.width / 28),
                      ),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: shiftWork.value == 2,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 2;
                                model.shift = Shift.Night;
                              }
                            },
                          )),
                      Text(
                        "مقطعی",
                        style: TextStyle(fontSize: Get.width / 28),
                      ),
                      Obx(() => Checkbox(
                            activeColor: buttonColor,
                            value: shiftWork.value == 3,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 3;
                                model.shift = Shift.Hour;
                              }
                            },
                          )),
                    ],
                  ),
                ),

                // hour of work
                Obx(() => shiftWork.value == 0
                    ? const SizedBox()
                    : Row(
                        children: [
                          Text(
                            "ساعت کاری از   ",
                            style: TextStyle(fontSize: Get.width / 30),
                          ),
                          SizedBox(
                              width: Get.width / 7,
                              child: ProfileTextInput(
                                textAlign: TextAlign.center,
                                text: "ساعت",
                                keyboardType: TextInputType.number,
                                onChanged: (value) => hours1 = value,
                              )),
                          const Text("  تا      "),
                          SizedBox(
                              width: Get.width / 7,
                              child: ProfileTextInput(
                                textAlign: TextAlign.center,
                                text: "ساعت",
                                keyboardType: TextInputType.number,
                                onChanged: (value) => hours2 = value,
                              )),
                        ],
                      )),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // person in home
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: Row(children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          "در طول مدت فعالیت نیروی اعزامی چه شخصی داخل منزل حضور دارد:   ",
                          style: TextStyle(fontSize: Get.width / 30),
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(
                          width: Get.width / 3,
                          child: ProfileTextInput(
                            text: "",
                            onChanged: (value) => model.peopleInHouse = value,
                          ),
                        ),
                      )
                    ])),

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // camera
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: Row(children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          "در محل نیروی اعزامی دوربین مداربسته وجود دارد؟  ",
                          style: TextStyle(fontSize: Get.width / 30),
                        ),
                      ),
                      Obx(() => Expanded(
                            flex: 2,
                            child: DropdownButton(
                                items: List.generate(
                                    2,
                                    (index) => DropdownMenuItem<bool>(
                                          child: Text(["خیر", "بلی"][index]),
                                          value: [false, true][index],
                                        )),
                                value: camera.value,
                                elevation: 5,
                                // style: TextStyle(fontSize: Get.width / 23),
                                onChanged: <bool>(value) {
                                  camera.value = value;
                                  model.cctv = value;
                                }),
                          )),
                    ])),

                // address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: Text("محدوده محل سکونت")),
                      // const Text("استان:  "),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                    label: Text(
                                  "استان",
                                  style: TextStyle(fontSize: Get.width / 28),
                                )),
                                controller: provinceController),
                            itemBuilder: (context, itemData) => ListTile(
                              title: Text(itemData.toString()),
                            ),
                            onSuggestionSelected: (suggestion) {
                              provinceController.text = suggestion.toString();
                              cityFocusNode.requestFocus();
                            },
                            suggestionsCallback: (pattern) => cities.keys
                                .where((element) => element.contains(pattern)),
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                  focusNode: cityFocusNode,
                                  decoration: InputDecoration(
                                      label: Text("شهر",
                                          style: TextStyle(
                                              fontSize: Get.width / 28))),
                                  controller: cityController),
                              itemBuilder: (context, itemData) => ListTile(
                                    title: Text(itemData.toString()),
                                  ),
                              onSuggestionSelected: (suggestion) =>
                                  cityController.text = suggestion.toString(),
                              suggestionsCallback: (pattern) =>
                                  (cities[provinceController.text] ?? []).where(
                                      (element) => element.contains(pattern)))),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            text: "محله",
                            onChanged: (value) => neighbourhood = value,
                          )),
                    ],
                  ),
                ),

                // description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 8,
                    child: TextFormField(
                      onChanged: (value) => model.description = value,
                      maxLines: 5,
                      style: TextStyle(fontSize: Get.width / 28),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                          labelText: "توضیحات",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              width: Get.width,
              height: Get.height / 10,
              child: NextButton(
                onNext: () {
                  model.nurseCategory = NurseCategory.Oldage;
                  model.from = hours1;
                  model.to = hours2;
                  model.ages = ages;
                  model.province = provinceController.text;
                  model.city = cityController.text;
                  model.neighborhood = neighbourhood;
                  model.problems = oldageProblem;
                  if (babySitterValidation(model)) {
                    FocusNode().unfocus();
                    Get.to(() => FinalStepScreen(
                          model: model,
                        ));
                  }
                },
              )),
          /*
          // button
          InkWell(
            onTap: () {
              model.nurseCategory = NurseCategory.Oldage;
              model.address = provinceController.text;
              model.hours = hours1;
              model.age = ages[0];
              var problem = "";
              for (var item in oldageProblem) {
                problem += [
                      "پوشک",
                      "لگن",
                      "سون",
                      "آلزایمر",
                      "پارکینگ سون",
                      "ام اس",
                      "هیچ کدام"
                    ][item] +
                    ',';
              }
              if (babySitterValidation(model)) {
                model.address =
                    "استان ${provinceController.text} شهر ${cityController.text} محله $neighbourhood";
                model.hours = "از ساعت $hours1 تا ساعت $hours2";
                model.age = ages
                    .where((element) => element.isNotEmpty)
                    .toString()
                    .replaceAll('(', '')
                    .replaceAll(')', '');
                FocusNode().unfocus();
                Get.to(() => FinalStepScreen(
                      model: model,
                    ));
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
                "مرحله بعدی",
                style: TextStyle(
                    color: const Color(0xffffffff), fontSize: Get.width / 22),
              ),
            ),
          ),*/
        ]));
  }
}
