import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/viewmodels/home/profile_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/profile_text_input.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileViewmodel());
    RxBool isMan = true.obs;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: Get.width,
          height: Get.height,
          child: Stack(children: [
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                color: const Color(0xfff9f9f9),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 7,
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 1.7,
                  margin: EdgeInsets.only(
                    top: Get.height / 3.5,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height / 35,
                      ),
                      ProfileTextInput(
                        controller: TextEditingController(text: "رایا"),
                        text: "نام",
                        icon: const Icon(Icons.person),
                      ),
                      SizedBox(
                        height: Get.height / 55,
                      ),
                      ProfileTextInput(
                        controller: TextEditingController(text: "نیارش"),
                        text: "نام خانوادگی",
                        icon: const Icon(Icons.person),
                      ),
                      SizedBox(
                        height: Get.height / 55,
                      ),
                      ProfileTextInput(
                        text: "شماره تلفن",
                        controller: TextEditingController(text: "0912123456"),
                        icon: const Icon(Icons.phone),
                        enable: false,
                      ),
                      SizedBox(
                        height: Get.height / 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("جنسیت:" "      "),
                          const Text("مرد"),
                          Obx(() => Checkbox(
                                value: isMan.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    isMan.value = value;
                                  }
                                },
                              )),
                          const Text("زن"),
                          Obx(() => Checkbox(
                                value: !isMan.value,
                                onChanged: (value) {
                                  if (value != null) {
                                    isMan.value = !value;
                                  }
                                },
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: Get.width,
              height: Get.height / 3.2,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/images/top_menu.png",
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_forward,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: InkWell(
                      onTap: _controller.updateImage,
                      child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width / 6,
                          backgroundColor: Colors.white,
                          backgroundImage:
                              SingletonClass().imageUrl?.isEmpty ?? true
                                  ? null
                                  : CachedNetworkImageProvider(
                                      // baseUrl +
                                      //   '/uploads/' +
                                      (SingletonClass().imageUrl ?? ""))
                          //  const NetworkImage(
                          //     "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"),
                          // child: Icon(
                          //   Icons.person_rounded,
                          //   color: const Color(0xff004D55),
                          //   size: MediaQuery.of(context).size.width / 4,
                          // ),
                          ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 8.0, bottom: 15),
                  //   child: Text(
                  //     "سجاد رحیمی",
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: MediaQuery.of(context).size.width / 23),
                  //   ),
                  // ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
