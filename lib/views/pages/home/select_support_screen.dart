import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/pages/home/support_screen.dart';
import 'package:url_launcher/url_launcher.dart';

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
          onTap: () => launchUrl(Uri.parse('tel:02632406705')),
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
          onTap: () => Get.to(() => const SupportScreen()),
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
