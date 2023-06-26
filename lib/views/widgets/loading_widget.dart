import 'package:flutter/material.dart' show Color;
import 'package:flutter_spinkit/flutter_spinkit.dart' show SpinKitThreeBounce;
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

void loading(
    {bool transparent = false, Color color = const Color(0xffffffff)}) async {
  Get.dialog(
    SpinKitThreeBounce(
      color: color,
      size: 23.0,
    ),
    barrierColor: transparent
        ? const Color.fromRGBO(255, 255, 255, 0)
        : const Color.fromRGBO(0, 0, 0, 0.5),
    barrierDismissible: false,
  );
}
