// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/viewmodels/nurses/nurse_detail_screen.dart';
import 'package:rayaniyaresh/views/pages/nurses/screens/edit_screen.dart';
import 'package:rayaniyaresh/views/pages/nurses/widgets/nurse_information_widget.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:url_launcher/url_launcher_string.dart';

class NurseInformationScreen extends StatelessWidget {
  const NurseInformationScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NurseDetailViewModel(id));

    return Container(
      color: Colors.white,
      child: controller.obx(
        (status) => Scaffold(
            appBar: screensAppbar(
                context: context, title: controller.model?.name ?? ''),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                Obx(() => NurseInformationWidget(
                      isPayment: true,
                      title: 'وضعیت پرداخت',
                      value: controller.paidStatus.value,
                    )),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره',
                            value: controller.model?.phoneNumber ?? '',
                          ));
                      if (result != null) {
                        controller.model?.phoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.phoneNumber ?? '')),
                Obx(() => NurseInformationWidget(
                      showEditIcon: controller.showEditIcon.value,
                      title: 'نام',
                      value: controller.model?.name ?? '',
                      onEditTap: () async {
                        final String? result = await Get.to(() => EditScreen(
                              title: 'نام',
                              value: controller.model?.name ?? '',
                            ));
                        if (result != null) {
                          controller.model?.name = result;
                          controller.change(null, status: RxStatus.success());
                        }
                      },
                    )),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نام پدر',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نام پدر',
                            value: controller.model?.fatherName ?? '',
                          ));
                      if (result != null) {
                        controller.model?.fatherName = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.fatherName ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'تولد',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'تولد',
                            value: controller.model?.birthday ?? '',
                          ));
                      if (result != null) {
                        controller.model?.birthday = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.birthday ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'کد ملی',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'کد ملی',
                            value: controller.model?.nationalCode ?? '',
                          ));
                      if (result != null) {
                        controller.model?.nationalCode = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.nationalCode ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره شناسنامه',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره شناسنامه',
                            value: controller.model?.nationalNumber ?? '',
                          ));
                      if (result != null) {
                        controller.model?.nationalNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.nationalNumber ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'تحصیلات',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'تحصیلات',
                            value: controller.model?.education ?? '',
                          ));
                      if (result != null) {
                        controller.model?.education = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.education ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شهر تولد',
                    value: controller.model?.bornCity ?? '')),
                Obx(() => NurseInformationWidget(
                    isAddress: true,
                    showEditIcon: controller.showEditIcon.value,
                    title: 'آدرس',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'آدرس',
                            value: controller.model?.address ?? '',
                          ));
                      if (result != null) {
                        controller.model?.address = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.address ?? '')),
                NurseImageWidget(
                    title: 'عکس پرسنلی',
                    value: controller.model?.nurseImages?.picture ?? ''),
                NurseImageWidget(
                    title: 'صفحه اول شناسنامه',
                    value: controller.model?.nurseImages?.firstPageImage ?? ''),
                NurseImageWidget(
                    title: 'صفحه توضیحات',
                    value:
                        controller.model?.nurseImages?.descriptionImage ?? ''),
                Obx(() => NurseCategoryWidget(
                    title: 'دسته بندی',
                    showEditIcon: controller.showEditIcon.value,
                    value: controller.model?.nurseCategory ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'مراقبت ویژه',
                    value:
                        controller.model?.specialCare == true ? 'بله' : 'خیر')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'ضمانت',
                    value: controller.getGuarantee())),
                Obx(() => NurseProblemWidget(
                    title: 'ویژگی دیگر',
                    showEditIcon: controller.showEditIcon.value,
                    value: controller.model?.otherProp ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره همسر',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره همسر',
                            value: controller.model?.husbandPhoneNumber ?? '',
                          ));
                      if (result != null) {
                        controller.model?.husbandPhoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value:
                        controller.model?.husbandPhoneNumber ?? 'وارد نشده')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره فرزند',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره فرزند',
                            value: controller.model?.childPhoneNumber ?? '',
                          ));
                      if (result != null) {
                        controller.model?.childPhoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.childPhoneNumber ?? 'وارد نشده')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره والدین',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره والدین',
                            value: controller.model?.parentPhoneNumber ?? '',
                          ));
                      if (result != null) {
                        controller.model?.parentPhoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: controller.model?.parentPhoneNumber ?? 'وارد نشده')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نام آشنا ۱',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نام آشنا ۱',
                            value: controller.model?.nurseFamily?[0].name ?? '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[0].name = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 1
                        ? ''
                        : controller.model?.nurseFamily?[0].name ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نسبت آشنا ۱',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نسبت آشنا ۱',
                            value:
                                controller.model?.nurseFamily?[0].information ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[0].information = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 1
                        ? ''
                        : controller.model?.nurseFamily?[0].information ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'مدت آشنایی ۱',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'مدت آشنایی ۱',
                            value: controller.model?.nurseFamily?[0].knowTime ??
                                '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[0].knowTime = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 1
                        ? ''
                        : controller.model?.nurseFamily?[0].knowTime ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره آشنا ۱',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره آشنا ۱',
                            value:
                                controller.model?.nurseFamily?[0].phoneNumber ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[0].phoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 1
                        ? ''
                        : controller.model?.nurseFamily?[0].phoneNumber ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نام آشنا ۲',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نام آشنا ۲',
                            value: controller.model?.nurseFamily?[1].name ?? '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[1].name = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 2
                        ? ''
                        : controller.model?.nurseFamily?[1].name ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نسبت آشنا ۲',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نسبت آشنا ۲',
                            value:
                                controller.model?.nurseFamily?[1].information ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[1].information = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 2
                        ? ''
                        : controller.model?.nurseFamily?[1].information ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'مدت آشنایی ۲',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'مدت آشنایی ۲',
                            value: controller.model?.nurseFamily?[1].knowTime ??
                                '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[1].knowTime = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 2
                        ? ''
                        : controller.model?.nurseFamily?[1].knowTime ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره آشنا ۲',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره آشنا ۲',
                            value:
                                controller.model?.nurseFamily?[1].phoneNumber ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[1].phoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 2
                        ? ''
                        : controller.model?.nurseFamily?[1].phoneNumber ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نام آشنا ۳',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نام آشنا ۳',
                            value: controller.model?.nurseFamily?[2].name ?? '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[2].name = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 3
                        ? ''
                        : controller.model?.nurseFamily?[2].name ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'نسبت آشنا ۳',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'نسبت آشنا ۳',
                            value:
                                controller.model?.nurseFamily?[2].information ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[2].information = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 3
                        ? ''
                        : controller.model?.nurseFamily?[2].information ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'مدت آشنایی ۳',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'مدت آشنایی ۳',
                            value: controller.model?.nurseFamily?[2].knowTime ??
                                '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[2].knowTime = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 3
                        ? ''
                        : controller.model?.nurseFamily?[2].knowTime ?? '')),
                Obx(() => NurseInformationWidget(
                    showEditIcon: controller.showEditIcon.value,
                    title: 'شماره آشنا ۳',
                    onEditTap: () async {
                      final String? result = await Get.to(() => EditScreen(
                            title: 'شماره آشنا ۳',
                            value:
                                controller.model?.nurseFamily?[2].phoneNumber ??
                                    '',
                          ));
                      if (result != null) {
                        controller.model?.nurseFamily?[2].phoneNumber = result;
                        controller.change(null, status: RxStatus.success());
                      }
                    },
                    value: (controller.model?.nurseFamily?.length ?? 0) < 3
                        ? ''
                        : controller.model?.nurseFamily?[2].phoneNumber ?? '')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // edit and save button
                    InkWell(
                      onTap: () {
                        if (controller.showEditIcon.value) {
                          controller.showEditIcon.value = false;
                          controller.updateNurse();
                        } else {
                          controller.showEditIcon.value = true;
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 20),
                        width: MediaQuery.sizeOf(context).width / 3.5,
                        height: MediaQuery.sizeOf(context).height / 17,
                        color: Colors.grey,
                        alignment: Alignment.center,
                        child: Obx(() => Text(
                              controller.showEditIcon.value
                                  ? 'ذخیره'
                                  : "ویرایش",
                              style: const TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    // download button
                    InkWell(
                      onTap: () {
                        if (controller.model?.pdfLink != null) {
                          launchUrlString(
                              '$baseUrl/uploads/${controller.model?.pdfLink}');
                        }
                      },
                      child: Obx(
                        () => controller.isPaid.value == 'ok'
                            ? Container(
                                margin: const EdgeInsets.only(top: 20),
                                width: MediaQuery.sizeOf(context).width / 3.5,
                                height: MediaQuery.sizeOf(context).height / 17,
                                color: Colors.green,
                                alignment: Alignment.center,
                                child: const Text(
                                  "دانلود PDF",
                                  style: TextStyle(color: Colors.white),
                                ))
                            : const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ]),
            )),
      ),
    );
  }
}
