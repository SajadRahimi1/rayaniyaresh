import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  const Otp(
      {Key? key,
      required this.index,
      this.onChanged,
      this.controller,
      this.isCorrect = 2})
      : super(key: key);
  final int index;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final int isCorrect;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      padding: const EdgeInsets.all(5),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: onChanged,
        decoration: InputDecoration(
            counterText: "",
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor(isCorrect),
                  width: 1.5,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: borderColor(isCorrect),
                  width: 1.5,
                ))),
      ),
    ));
  }

  Color borderColor(int? correct) {
    switch (correct) {
      case 2:
        return const Color(0xffb0b0b0);
      case 1:
        return Colors.green;
      case 0:
        return Colors.red;
    }
    return const Color(0xffb0b0b0);
  }
}
