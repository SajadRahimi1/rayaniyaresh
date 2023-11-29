import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/validations/baby_sitter_validation.dart';
import 'package:rayaniyaresh/models/constants/city_constant.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/final_step_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class BabySitterScreen extends StatefulWidget {
  const BabySitterScreen({Key? key}) : super(key: key);

  @override
  State<BabySitterScreen> createState() => _BabySitterScreenState();
}

class _BabySitterScreenState extends State<BabySitterScreen> {
  RxInt gender = (-1).obs;
  RxInt childNumber = (1).obs;
  RxInt shiftWork = (-1).obs;
  RxBool camera = false.obs;
  List<String> ages = List.generate(4, (index) => "");
  String province = "", city = "", neighbourhood = "", hours1 = "", hours2 = "";
  final RequestNurseModel model = RequestNurseModel();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model.cctv = camera.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: screensAppbar(context: context, title: "اطلاعات کودک"),
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
                      "تعداد کودک: " "   ",
                      style: TextStyle(fontSize: Get.width / 28),
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
                      style: TextStyle(fontSize: Get.width / 28),
                    ),
                    Text(
                      "پسر",
                      style: TextStyle(fontSize: Get.width / 28),
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
                      "دختر",
                      style: TextStyle(fontSize: Get.width / 28),
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
                      style: TextStyle(fontSize: Get.width / 28),
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
                          text: "سن کودک ${index + 1}",
                          onChanged: (value) => ages[index] = value,
                        ),
                      )),
                ),

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
                          Text(
                            "  تا      ",
                            style: TextStyle(fontSize: Get.width / 30),
                          ),
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

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

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
                                decoration:
                                    const InputDecoration(label: Text("استان")),
                                controller: provinceController),
                            itemBuilder: (context, itemData) => ListTile(
                              title: Text(itemData.toString()),
                            ),
                            onSuggestionSelected: (suggestion) {
                              provinceController.text = suggestion.toString();
                              cityController.clear();
                            },
                            suggestionsCallback: (pattern) => cities.keys
                                .where((element) => element.contains(pattern)),
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                  decoration:
                                      const InputDecoration(label: Text("شهر")),
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

                const Divider(
                  thickness: 1,
                  color: buttonColor,
                ),

                // description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 8,
                    child: TextFormField(
                      onChanged: (value) => model.description = value,
                      style: TextStyle(fontSize: Get.width / 28),
                      maxLines: 5,
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
                model.nurseCategory = NurseCategory.Kid;
                model.address = provinceController.text;
                model.hours = hours1;
                model.age = ages[0];
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
            ),
          )
          /* button
          InkWell(
            onTap: () {
              model.nurseCategory = NurseCategory.Kid;
              model.address = provinceController.text;
              model.hours = hours1;
              model.age = ages[0];
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
