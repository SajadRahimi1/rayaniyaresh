import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/core/validations/baby_sitter_validation.dart';
import 'package:rayaniyaresh/models/constants/city_constant.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/views/pages/nurse_service/final_step_screen.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class PatientFormScreen extends StatefulWidget {
  const PatientFormScreen({Key? key}) : super(key: key);

  @override
  State<PatientFormScreen> createState() => _PatientFormScreen();
}

class _PatientFormScreen extends State<PatientFormScreen> {
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
        appBar: screensAppbar(context: context, title: "پرستار بیمار"),
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
                      "تعداد بیمار: " "   ",
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
                        // style: TextStyle(fontSize: Get.width / 28),
                        onChanged: <int>(value) => childNumber.value = value)),
                  ],
                ),

                const Divider(thickness: 1),

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
                          value: gender.value == 0,
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
                          value: gender.value == 1,
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
                          onChanged: (value) {
                            if (value != null) {
                              gender.value = 2;
                              model.gender = Gender.Both;
                            }
                          },
                        )),
                  ],
                ),

                const Divider(thickness: 1),

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
                          text: "سن بیمار ${index + 1}",
                          onChanged: (value) => ages[index] = value,
                        ),
                      )),
                ),

                const Divider(thickness: 1),

                // shift
                SizedBox(
                  height: Get.height / 30,
                  width: Get.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(
                        "شیفت کاری:" "  ",
                        style: TextStyle(fontSize: Get.width / 30),
                      ),
                      Text(
                        "شبانه روزی",
                        style: TextStyle(fontSize: Get.width / 30),
                      ),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 0,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 0;
                                model.shift = Shift.Boarding;
                              }
                            },
                          )),
                      Text(
                        "شبانه",
                        style: TextStyle(fontSize: Get.width / 30),
                      ),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 1,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 1;
                                model.shift = Shift.Night;
                              }
                            },
                          )),
                      Text(
                        "مقطعی",
                        style: TextStyle(fontSize: Get.width / 30),
                      ),
                      Obx(() => Checkbox(
                            value: shiftWork.value == 2,
                            onChanged: (value) {
                              if (value != null) {
                                shiftWork.value = 2;
                                model.shift = Shift.Hour;
                              }
                            },
                          )),
                    ],
                  ),
                ),

                const Divider(thickness: 1),

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

                const Divider(thickness: 1),

                // person in home
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Text(
                            "در طول مدت فعالیت نیروی اعزامی چه شخصی داخل منزل حضور دارد:   ",
                            style: TextStyle(fontSize: Get.width / 30),
                          ),
                          SizedBox(
                            width: Get.width / 2.5,
                            child: ProfileTextInput(
                              text: "",
                              onChanged: (value) => model.peopleInHouse = value,
                            ),
                          )
                        ]))),

                const Divider(thickness: 1),

                // camera
                SizedBox(
                    width: Get.width,
                    height: Get.height / 10,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          Text(
                            "آیا در محل نیروی اعزامی دوربین مداربسته وجود دارد؟:   ",
                            style: TextStyle(fontSize: Get.width / 30),
                          ),
                          Obx(() => DropdownButton(
                              items: List.generate(
                                  2,
                                  (index) => DropdownMenuItem<bool>(
                                        child: Text(["خیر", "بلی"][index]),
                                        value: [false, true][index],
                                      )),
                              value: camera.value,
                              elevation: 5,
                              // style: TextStyle(fontSize: Get.width / 28),
                              onChanged: <bool>(value) {
                                camera.value = value;
                                model.cctv = value;
                              })),
                        ]))),

                const Divider(thickness: 1),

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
                                  style: TextStyle(fontSize: Get.width / 30),
                                )),
                                controller: provinceController),
                            itemBuilder: (context, itemData) => ListTile(
                              title: Text(itemData.toString()),
                            ),
                            onSuggestionSelected: (suggestion) =>
                                provinceController.text = suggestion.toString(),
                            suggestionsCallback: (pattern) => cities.keys
                                .where((element) => element.contains(pattern)),
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                  decoration: InputDecoration(
                                      label: Text(
                                    "شهر",
                                    style: TextStyle(fontSize: Get.width / 30),
                                  )),
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

                const Divider(thickness: 1),

                // description
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 45),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 8,
                    child: TextFormField(
                      onChanged: (value) => model.description = value,
                      maxLines: 5,
                      style: TextStyle(fontSize: Get.width / 30),
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
          // button
          InkWell(
            onTap: () {
              model.nurseCategory = NurseCategory.Patient;
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
          ),
        ]));
  }
}
