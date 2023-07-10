import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/pages/more/reserved_list_screen.dart';
import 'package:rayaniyaresh/views/pages/reserve_class/information_form_screen.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
          itemCount: 10,
          padding: const EdgeInsets.symmetric(horizontal: 5) +
              const EdgeInsets.only(top: 5),
          itemBuilder: (_, index) => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.to(() => const ReservedListScreen());
                        break;
                      case 1:
                        Get.to(() => const InformationFormScreen(
                              isReserving: false,
                            ));
                        break;
                      default:
                    }
                  },
                  leading: Icon([
                    Icons.paste,
                    Icons.person_add,
                    Icons.search,
                    Icons.cast_for_education,
                    Icons.cases_outlined,
                    Icons.public,
                    Icons.bookmark_added,
                    Icons.photo,
                    Icons.payment,
                    Icons.mark_chat_unread_outlined,
                  ][index]),
                  // leading:
                  //     ImageIcon(AssetImage("assets/images/icons/paste.png")),
                  minLeadingWidth: 20,
                  iconColor: Colors.blueAccent,
                  textColor: Colors.blueAccent,
                  title: Text(
                    [
                      "لیست رزرو ها",
                      "فرم ثبت نام",
                      "جست و جو",
                      "خدمات آموزشی",
                      "بهداشت و ایمنی",
                      "رزرواسیون",
                      "اخبار",
                      "علاقه مندی ها",
                      "گالری تصاویر",
                      "پرداخت",
                      "پشتیبانی با رایچت",
                    ][index],
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              )),
    );
  }
}
