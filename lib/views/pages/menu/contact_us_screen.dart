import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusScreen extends StatelessWidget {
  const ContactusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: 'تماس با ما'),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10) +
              EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 45),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: InkWell(
              onTap: () => launchUrl(Uri.parse('tel:02632406705')),
              child: Row(
                children: [
                  const Text(
                    "تماس با پشتیبانی : ",
                    textDirection: TextDirection.rtl,
                  ),
                  Text(
                    "026-32406705".toPersianDigit(),
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                        color: buttonColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10) +
              EdgeInsets.only(bottom: MediaQuery.sizeOf(context).height / 45),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: InkWell(
              onTap: () => launchUrl(Uri.parse('tel:02632406705')),
              child: Text(
                'پاسخگویی شبانه روزی',
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 30),
              ),
            ),
          ),
        ),
        Center(
            child: Container(
                width: MediaQuery.sizeOf(context).width / 1.5,
                height: 3,
                color: buttonColor)),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).height / 45, horizontal: 10),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: InkWell(
              child: Text(
                "آدرس: استان البرز - شهرستان کرج - شهر کرج مرکزی - رجایی شهر - فاز 1 - خیابان آزادی - خیابان پنجم - پلاک 186 - طبقه 1",
                textDirection: TextDirection.rtl,
                style:
                    TextStyle(fontSize: MediaQuery.sizeOf(context).width / 32),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
