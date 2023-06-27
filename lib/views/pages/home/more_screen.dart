import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: ListView.builder(
          itemCount: 10,
          padding:
              EdgeInsets.symmetric(horizontal: 5) + EdgeInsets.only(top: 5),
          itemBuilder: (_, index) => Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
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
