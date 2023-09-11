import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class SelectSupportScreen extends StatelessWidget {
  const SelectSupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height / 25,
        ),
        ListTile(
          minLeadingWidth: 1,
          title: Row(
            children: [
              const Text("تماس با پشتیبانی : "),
              Text(
                "026-32406705".toPersianDigit(),
                style: const TextStyle(color: buttonColor),
              ),
            ],
          ),
          leading: const Icon(
            Icons.phone,
            color: buttonColor,
          ),
        ),
        ListTile(
          minLeadingWidth: 1,
          title: Row(
            children: [
              const Text(
                "چت آنلاین :",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                " (پاسخ سریع)",
                style: TextStyle(
                    color: buttonColor,
                    fontSize: MediaQuery.sizeOf(context).width / 30),
              )
            ],
          ),
          leading: const Icon(
            Icons.chat_bubble,
            color: buttonColor,
          ),
        ),
      ]),
    );
  }
}
