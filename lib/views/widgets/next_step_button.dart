import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class NextStepButton extends StatelessWidget {
  const NextStepButton({Key? key,this.onTap,required this.title}) : super(key: key);
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: buttonColor),
        child: Text(
          title,
          style: TextStyle(
              color: const Color(0xffffffff), fontSize: MediaQuery.of(context).size.width / 22),
        ),
      ),
    );
  }
}
