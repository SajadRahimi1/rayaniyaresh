import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rayaniyaresh/core/services/biometric_service.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';
import 'package:rayaniyaresh/models/constants/singleton_class.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';
import 'package:rayaniyaresh/views/pages/home/profile_screen.dart';
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';
import 'package:rayaniyaresh/views/pages/menu/contact_us_screen.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool biometric = false.obs;
    final GetStorage getStorage = GetStorage();
    GetStorage.init().then(
        (value) => biometric.value = getStorage.read('biometric') ?? false);
    print(SingletonClass().imageUrl);
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 1.5,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Color(0xffffffff)
                // image: DecorationImage(
                //     image: AssetImage("assets/images/images/menu-back.png"),
                //     fit: BoxFit.fill)
                ),
            child: Column(
              children: [
                // top of menu
                InkWell(
                  onTap: () => Get.to(() => const ProfileScreen()),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 4.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/images/top_menu.png",
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          filterQuality: FilterQuality.medium,
                        ),
                        Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: MediaQuery.of(context).size.width / 8,
                                backgroundColor: Colors.white,
                                backgroundImage:
                                    SingletonClass().imageUrl?.isEmpty ?? true
                                        ? null
                                        : CachedNetworkImageProvider(baseUrl +
                                            '/uploads/' +
                                            (SingletonClass().imageUrl ?? ""))),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                SingletonClass().name ?? "",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 25),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                ),

                // list tiles
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 50),
                  child: SizedBox(
                      child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // about us list tile
                      // ListTile(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const AboutusScreen()));
                      //   },
                      //   title: Text(
                      //     "درباره ما",
                      //     style: TextStyle(
                      //         color: const Color(0xff656565),
                      //         fontSize: MediaQuery.of(context).size.width / 32),
                      //   ),
                      //   leading: SizedBox.square(
                      //     dimension: MediaQuery.of(context).size.width / 18,
                      //     child: Image.asset(
                      //       "assets/images/icons/aboutus.png",
                      //     ),
                      //   ),
                      // ),
                      // const Divider(
                      //   color: Color(0xffe5e5e5),
                      //   height: 1,
                      //   thickness: 0.5,
                      // ),
                      // contact us list tile

                      ListTile(
                        onTap: () async {
                          // await launchUrl(Uri.parse('tel:02632406705'));
                          Get.to(() => const ContactusScreen());
                        },
                        //   Get.to(() => const ContactScreen(),
                        //       transition: Transition.noTransition);
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (context) => const ContactScreen()));
                        // },
                        title: Text(
                          "تماس با ما ",
                          style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: MediaQuery.of(context).size.width / 32),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/contact.png",
                          ),
                        ),
                      ),

                      Container(
                        height: 1,
                        margin: EdgeInsets.only(
                            // top: MediaQuery.of(context).size.height / 30,
                            bottom: MediaQuery.of(context).size.height / 50),
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(255, 255, 255, 0),
                            Color(0xff9A7ACD),
                            Color.fromRGBO(255, 255, 255, 0),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        )),
                      ),

                      ListTile(
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/biometric.png",
                          ),
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        title: Text(
                          "ورود با اثر انگشت",
                          style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: MediaQuery.of(context).size.width / 32),
                        ),
                        trailing: Obx(() => Switch(
                            value: biometric.value,
                            onChanged: (value) async {
                              if (value) {
                                final BiometricService biometricService =
                                    BiometricService();
                                await biometricService.fillVariable();
                                if (biometricService
                                    .canAuthenticateWithBiometrics) {
                                  getStorage.write('biometric', value);
                                  biometric.value = value;
                                } else {
                                  showMessage(
                                      title: 'خطا',
                                      message:
                                          'امکان ورود با اثرانگشت در تلفن شما یافت نشد',
                                      type: MessageType.warning);
                                }
                              } else {
                                biometric.value = value;
                                getStorage.write('biometric', value);
                              }
                            })),
                        onTap: () async {},
                      ),
                      // const Divider(
                      //   color: Color(0xffe5e5e5),
                      //   height: 1,
                      //   thickness: 1,
                      // ),
                      // rules list tile
                      // ListTile(
                      //   // onTap: () {
                      //   //   Navigator.push(
                      //   //       context,
                      //   //       MaterialPageRoute(
                      //   //           builder: (context) => const RulesScreen()));
                      //   // },
                      //   title: Text(
                      //     "قوانین و مقررات",
                      //     style: TextStyle(
                      //         color: const Color(0xff656565),
                      //         fontSize: MediaQuery.of(context).size.width / 32),
                      //   ),
                      //   leading: SizedBox.square(
                      //     dimension: MediaQuery.of(context).size.width / 18,
                      //     child: Image.asset(
                      //       "assets/images/icons/rules.png",
                      //     ),
                      //   ),
                      // ),

                      // const Divider(
                      //   color: Color(0xffe5e5e5),
                      //   height: 1,
                      //   thickness: 0.5,
                      // ),
                      // license list tile

                      //support list tile
                      // ListTile(
                      //   // onTap: () async {
                      //   //   launchUrl(Uri.parse('tel://02155922169'));
                      //   // },
                      //   title: Text(
                      //     "پشتیبانی",
                      //     style: TextStyle(
                      //         color: const Color(0xff656565),
                      //         fontSize: MediaQuery.of(context).size.width / 32),
                      //   ),
                      //   leading: SizedBox.square(
                      //     dimension: MediaQuery.of(context).size.width / 18,
                      //     child: Image.asset(
                      //       "assets/images/icons/support.png",
                      //     ),
                      //   ),
                      // ),

                      // // exit list tile
                      // const Divider(
                      //   color: Color(0xffe5e5e5),
                      //   height: 1,
                      //   thickness: 0.5,
                      // ),

                      //share list tile
                      // ListTile(
                      //   onTap: () async {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const ContactScreen()));
                      //   },
                      //   title: Text(
                      //     "معرفی به دوستان",
                      //     style: TextStyle(
                      //         color: const Color(0xff656565),
                      //         fontSize: MediaQuery.of(context).size.width / 32),
                      //   ),
                      //   leading: const Icon(Icons.share, color: purple),
                      //   // SizedBox.square(
                      //   //   dimension: MediaQuery.of(context).size.width / 18,
                      //   //   child: Image.asset(
                      //   //     "assets/images/icons/support.png",
                      //   //   ),
                      //   // ),
                      // ),
                    ],
                  )),
                ),

                // divider line
                Container(
                  height: 1,
                  margin: EdgeInsets.only(
                      // top: MediaQuery.of(context).size.height / 30,
                      bottom: MediaQuery.of(context).size.height / 50),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(255, 255, 255, 0),
                      Color(0xff9A7ACD),
                      Color.fromRGBO(255, 255, 255, 0),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
                ),
                // exit list tile
                ListTile(
                  // onTap: service.exit
                  // GetStorage storage = GetStorage();
                  // await GetStorage.init();
                  // storage.remove("token");
                  onTap: () async {
                    await GetStorage.init();
                    // await getStorage.remove('token');
                    Get.offAll(() => const GetPhoneScreen(isExit: true));
                  },
                  // ,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    "خروج",
                    style: TextStyle(
                        color: const Color(0xff858585),
                        fontSize: MediaQuery.of(context).size.width / 34),
                  ),
                  leading:
                      const Icon(Icons.exit_to_app, color: Color(0xff858585)),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      "توسعه و طراحی توسط رایانیارش کارا",
                      style: TextStyle(color: Color(0xff9f9f9f)),
                    ),
                  ),
                )

                // child: Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   textDirection: TextDirection.ltr,
                //   children: List.generate(
                //       4,
                //       (index) => Image.asset(
                //             "assets/images/icons/${[
                //               "telegram3.png",
                //               "instagram3.png",
                //               "linkedin3.png",
                //               "whatsapp3.png",
                //             ][index]}",
                //             height: MediaQuery.of(context).size.height / 45,
                //             filterQuality: FilterQuality.medium,
                //           )),
                // ),
              ],
            ),
          ),

          // Expanded(
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Container(
          //       color: const Color.fromRGBO(9, 21, 22, 0.8),
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
