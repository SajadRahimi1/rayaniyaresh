import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/viewmodels/home/main_viewmodel.dart';
import 'package:rayaniyaresh/views/pages/home/home_screen.dart';
import 'package:rayaniyaresh/views/pages/home/profile_screen.dart';
import 'package:rayaniyaresh/views/widgets/app_widget.dart';
import 'package:rayaniyaresh/views/widgets/menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.initPage = 1}) : super(key: key);
  final int initPage;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _productKey = GlobalKey<ScaffoldState>();

  late final MainViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = Get.put(MainViewController(initPage: widget.initPage));
  }

  @override
  void dispose() {
    super.dispose();
    _productKey.currentState?.dispose();
    // _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool doubleTap = false;
    return WillPopScope(
        onWillPop: () async {
          FocusScope.of(context).unfocus();
          if (_productKey.currentState?.isDrawerOpen ?? false) {
            Navigator.of(context).pop();
            return false;
          }
          // double tap to close app
          if (!doubleTap) {
            doubleTap = true;
            var snackBar =
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("برای خروج دوباره کلیک کنید"),
              duration: Duration(milliseconds: 1500),
            ));
            snackBar.closed.then((value) => doubleTap = false);
          } else {
            exit(0);
          }
          return false;
        },
        child: Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
                child: Scaffold(
                    key: _productKey,
                    resizeToAvoidBottomInset: false,
                    drawer: const Menu(),
                    appBar: homeAppBar(
                      context: context,
                    ),
                    drawerEnableOpenDragGesture: false,
                    backgroundColor: const Color(0xffffffff),
                    body: Column(children: [
                      Expanded(
                          child: PageView(
                        controller: _controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          // const ProfileScreen(),
                          Container(),
                          const HomeScreen(),
                          Container(),
                          Container(),
                        ],
                      )),
                    ]),
                    bottomNavigationBar: Obx(() => BottomNavigationBar(
                          elevation: 1,
                          selectedItemColor: buttonColor,
                          unselectedItemColor: const Color(0xff757575),
                          backgroundColor: const Color(0xffF8FAFB),
                          iconSize: 20,
                          selectedFontSize: 11,
                          unselectedFontSize: 11,
                          type: BottomNavigationBarType.fixed,
                          currentIndex: _controller.currentPage.value,
                          onTap: (value) {
                            FocusScope.of(context).requestFocus(FocusNode());
                            FocusScope.of(context).unfocus();
                            _controller.currentPage.value = value;
                          },
                          showUnselectedLabels: true,
                          // unselectedLabelStyle: TextStyle(color: Color(0xffe3e3e3)),
                          items: List.generate(
                              3,
                              (index) => BottomNavigationBarItem(
                                    icon: Icon(
                                      [
                                        Icons.book,
                                        Icons.home,
                                        Icons.shopping_cart
                                      ][index],
                                      size: 28,
                                      // filterQuality: FilterQuality.medium,
                                    ),
                                    label: [
                                      "رزرو",
                                      "خانه",
                                      "فروشگاه",
                                      "پیمانکاری"
                                    ][index],
                                  )),
                        ))))));
  }
}
