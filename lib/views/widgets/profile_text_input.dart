import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class ProfileTextInput extends StatelessWidget {
  const ProfileTextInput({
    Key? key,
    required this.text,
    this.error = false,
    this.icon,
    this.onChanged,
    this.controller,
    this.keyboardType,
    this.required = true,
    this.ontap,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.enable = true,
  }) : super(key: key);
  final String text;
  final bool error, required;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool enable;
  final void Function()? ontap;
  final TextInputType? keyboardType;
  final Widget? icon;
  final int? maxLength;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: TextField(
          maxLength: maxLength,
          enabled: enable,
          controller: controller,
          keyboardType: keyboardType,
          // inputFormatters: [
          // FilteringTextInputFormatter.deny(RegExp("[a-zA-Z]")),
          // ],
          onChanged: onChanged,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width / 30,
          ),
          textAlign: textAlign,
          decoration: InputDecoration(
            counter: const SizedBox(),
            icon: icon,
            prefixIcon: required
                ? const Text(
                    "*",
                    style: TextStyle(color: Colors.red),
                  )
                : null,
            contentPadding: EdgeInsets.zero,
            prefixIconConstraints: const BoxConstraints(maxWidth: 0),
            iconColor: buttonColor,
            labelText: " " + text,
            labelStyle: TextStyle(
              color: const Color(0xff000000),
              fontSize: MediaQuery.of(context).size.width / 30,
            ),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: error ? const Color(0xffff0000) : const Color(0xffe5e5e5),
            )),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
              color: error ? const Color(0xffff0000) : const Color(0xffe5e5e5),
            )),
          )),
    );
  }
}
