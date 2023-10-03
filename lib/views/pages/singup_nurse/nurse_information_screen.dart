import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/city_constant.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/signup_nurse/nurse_information_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:rayaniyaresh/views/widgets/next_button.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as picker;

class NurseInformationScreen extends StatelessWidget {
  const NurseInformationScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(NurseInformationViewmodel());
    return Scaffold(
      appBar: screensAppbar(context: context, title: "اطلاعات شخصی"),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 25, vertical: Get.height / 35),
            child: Column(
              children: [
                ProfileTextInput(
                  controller: _controller.textEditingController[0],
                  text: "نام و نام خانوادگی:",
                  icon: const Icon(
                    Icons.person,
                  ),
                  onChanged: (value) {
                    _controller.nurseModel.name = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[1],
                  text: "نام پدر:",
                  icon: const Icon(Icons.family_restroom),
                  onChanged: (value) {
                    _controller.nurseModel.fatherName = value;
                  },
                ),
                ProfileTextInput(
                    text: "تاریخ تولد:",
                    enable: false,
                    controller: _controller.textEditingController[2],
                    ontap: () async {
                      picker.Jalali? picked =
                          await picker.showPersianDatePicker(
                        context: context,
                        initialDate: picker.Jalali.now(),
                        firstDate: picker.Jalali(1330, 8),
                        lastDate: picker.Jalali.now(),
                      );
                      if (picked != null) {
                        // _controller.birthday.value = picked.formatCompactDate();
                        _controller.textEditingController[2].text =
                            picked.formatCompactDate();
                        _controller.nurseModel.birthday =
                            picked.formatCompactDate();
                      }
                    },
                    icon: const Icon(
                      Icons.calendar_month,
                    )),
                ProfileTextInput(
                  controller: _controller.textEditingController[3],
                  text: "محل صدور:",
                  icon: const Icon(Icons.location_city),
                  onChanged: (value) {
                    _controller.nurseModel.bornCity = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[4],
                  text: "کد ملی:",
                  icon: const Icon(Icons.public),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _controller.nurseModel.nationalCode = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[5],
                  text: "شماره شناسنامه:",
                  icon: const Icon(Icons.public_sharp),
                  maxLength: 11,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _controller.nurseModel.nationalNumber = value;
                  },
                ),

                // education
                SizedBox(
                  width: Get.width,
                  height: Get.height / 12,
                  child: Row(
                    children: [
                      const Text("میزان تحصیلات :",
                          style: TextStyle(fontSize: 10)),
                      Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) => InkWell(
                                    onTap: () => _controller
                                        .educationIndex.value = index,
                                    child: Obx(() => Container(
                                          width: Get.width / 8,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 3,
                                              vertical: Get.height / 70),
                                          height: Get.height,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: _controller.educationIndex
                                                          .value ==
                                                      index
                                                  ? buttonColor
                                                  : const Color(0xffe5e5e5)),
                                          child: Text(
                                            _controller.educationStrings[index],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 9),
                                          ),
                                        )),
                                  )))
                    ],
                  ),
                ),

                // ProfileTextInput(
                //   controller: _controller.textEditingController[6],
                //   text: "آدرس دقیق منزل",
                //   icon: const Icon(Icons.pin_drop),
                //   onChanged: (value) {
                //     _controller.nurseModel.address = value;
                //   },
                // ),

                // address
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text("استان:  "),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                            textFieldConfiguration: TextFieldConfiguration(
                                decoration: InputDecoration(
                                    prefixIcon: const Text(
                                      "*",
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    contentPadding: EdgeInsets.zero,
                                    prefixIconConstraints:
                                        const BoxConstraints(maxWidth: 0),
                                    label: Text(
                                      " استان",
                                      style: TextStyle(
                                          fontSize: Get.width / 30,
                                          color: Colors.black),
                                    )),
                                controller: _controller.provinceController),
                            itemBuilder: (context, itemData) => ListTile(
                              title: Text(itemData.toString()),
                            ),
                            onSuggestionSelected: (suggestion) => _controller
                                .provinceController
                                .text = suggestion.toString(),
                            suggestionsCallback: (pattern) => cities.keys
                                .where((element) => element.contains(pattern)),
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: TypeAheadFormField(
                              textFieldConfiguration: TextFieldConfiguration(
                                  decoration: InputDecoration(
                                      prefixIcon: const Text(
                                        "*",
                                        style: TextStyle(color: Colors.red),
                                      ),
                                      contentPadding: EdgeInsets.zero,
                                      prefixIconConstraints:
                                          const BoxConstraints(maxWidth: 0),
                                      label: Text(
                                        " شهر",
                                        style: TextStyle(
                                            fontSize: Get.width / 30,
                                            color: Colors.black),
                                      )),
                                  controller: _controller.cityController),
                              itemBuilder: (context, itemData) => ListTile(
                                    title: Text(itemData.toString()),
                                  ),
                              onSuggestionSelected: (suggestion) => _controller
                                  .cityController.text = suggestion.toString(),
                              suggestionsCallback: (pattern) => (cities[
                                          _controller
                                              .provinceController.text] ??
                                      [])
                                  .where(
                                      (element) => element.contains(pattern)))),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            text: "محله",
                            onChanged: (value) =>
                                _controller.neighbourhood = value,
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            text: "نام خیابان",
                            onChanged: (value) => _controller.street = value,
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            required: false,
                            text: "نام کوچه",
                            onChanged: (value) => _controller.alley = value,
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            text: "پلاک",
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _controller.plate = value,
                          )),
                      SizedBox(
                          width: Get.width / 1,
                          child: ProfileTextInput(
                            text: "واحد",
                            keyboardType: TextInputType.number,
                            onChanged: (value) => _controller.number = value,
                          )),
                    ],
                  ),
                ),

                ProfileTextInput(
                  controller: _controller.textEditingController[7],
                  text: "شماره تلفن همراه:",
                  icon: const Icon(Icons.phone_android),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  onChanged: (value) {
                    _controller.nurseModel.phoneNumber = value;
                  },
                ),
                ProfileTextInput(
                  controller: _controller.textEditingController[8],
                  text: "شماره تلفن منزل:",
                  icon: const Icon(Icons.phone),
                  required: false,
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  onChanged: (value) {
                    _controller.nurseModel.homeNumber = value;
                  },
                ),
              ],
            ),
          ),
          // button
          SizedBox(
            width: Get.width,
            height: Get.height / 10,
            child: NextButton(onNext: _controller.validationForm),
          )
          /*
          InkWell(
            onTap: _controller.validationForm,
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
        ],
      ),
    );
  }
}
