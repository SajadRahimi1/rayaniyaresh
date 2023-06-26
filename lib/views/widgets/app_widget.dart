import 'package:flutter/material.dart';

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
    );
