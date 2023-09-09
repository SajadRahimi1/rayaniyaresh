import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

AppBar homeAppBar({
  required BuildContext context,
}) =>
    AppBar(
        elevation: 0.2,
        // backgroundColor: Color(0xff02B8CC),

        backgroundColor: const Color(0xffF8FAFB),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: const Icon(Icons.menu, color: Color(0xff000000), size: 26),
              onPressed: () {
                FocusScope.of(context).unfocus();
                Scaffold.of(context).openDrawer();
              });
        }),
        title: Text(
          "02632406705".toPersianDigit(),
          style: const TextStyle(color: Colors.black),
        ));

AppBar screensAppbar({required BuildContext context, String title = ""}) =>
    AppBar(
      backgroundColor: const Color(0xffF8FAFB),
      title: Text(
        title,
        style: const TextStyle(color: Color(0xff000000), fontSize: 17),
      ),
      centerTitle: true,
      elevation: 5,
      iconTheme: const IconThemeData(color: Color(0xff000000)),
      actions: const [
        // Padding(
        //   padding: const EdgeInsets.only(left: 8),
        //   child: IconButton(
        //     icon: const Icon(Icons.arrow_forward, color: Color(0xff000000)),
        //     onPressed: () => Navigator.pop(context),
        //   ),
        // )
      ],
    );
