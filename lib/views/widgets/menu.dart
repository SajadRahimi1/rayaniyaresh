import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/home/profile_screen.dart';
import 'package:rayaniyaresh/views/pages/login/get_phone_number_screen.dart';
import 'package:rayaniyaresh/views/pages/menu/aboutus_screen.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => Get.to(() => ProfileScreen()),
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
                              backgroundImage: const NetworkImage(
                                  "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "سجاد رحیمی",
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
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AboutusScreen()));
                        },
                        title: Text(
                          "درباره ما",
                          style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: MediaQuery.of(context).size.width / 32),
                        ),
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/aboutus.png",
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color(0xffe5e5e5),
                        height: 1,
                        thickness: 0.5,
                      ),
                      // contact us list tile
                      ListTile(
                        // onTap: () {
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
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/contact.png",
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color(0xffe5e5e5),
                        height: 1,
                        thickness: 1,
                      ),
                      // rules list tile
                      ListTile(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const RulesScreen()));
                        // },
                        title: Text(
                          "قوانین و مقررات",
                          style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: MediaQuery.of(context).size.width / 32),
                        ),
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/rules.png",
                          ),
                        ),
                      ),
                      const Divider(
                        color: Color(0xffe5e5e5),
                        height: 1,
                        thickness: 0.5,
                      ),
                      // license list tile

                      //support list tile
                      ListTile(
                        // onTap: () async {
                        //   launchUrl(Uri.parse('tel://02155922169'));
                        // },
                        title: Text(
                          "پشتیبانی",
                          style: TextStyle(
                              color: const Color(0xff656565),
                              fontSize: MediaQuery.of(context).size.width / 32),
                        ),
                        leading: SizedBox.square(
                          dimension: MediaQuery.of(context).size.width / 18,
                          child: Image.asset(
                            "assets/images/icons/support.png",
                          ),
                        ),
                      ),

                      // exit list tile
                      const Divider(
                        color: Color(0xffe5e5e5),
                        height: 1,
                        thickness: 0.5,
                      ),

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
                  onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GetPhoneScreen(
                                isExit: true,
                              ))),
                  // ,
                  title: Text(
                    "خروج",
                    style: TextStyle(
                        color: const Color(0xff858585),
                        fontSize: MediaQuery.of(context).size.width / 34),
                  ),
                  leading:
                      const Icon(Icons.exit_to_app, color: Color(0xff858585)),
                ),

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
