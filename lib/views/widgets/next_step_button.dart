import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class NextStepButton extends StatelessWidget {
  const NextStepButton(
      {Key? key, this.onTap, required this.title, this.enable = true})
      : super(key: key);
  final void Function()? onTap;
  final String title;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 13,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            color: enable ? buttonColor : Color(0xff989898)),
        child: Text(
          title,
          style: TextStyle(
              color: const Color(0xffffffff),
              fontSize: MediaQuery.of(context).size.width / 26),
        ),
      ),
    );
  }
}
