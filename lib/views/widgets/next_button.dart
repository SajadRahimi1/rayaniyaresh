import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key, this.onNext}) : super(key: key);
  final void Function()? onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffefefef),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(children: [
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width / 20,
                  backgroundColor: Colors.white,
                  child: const Center(
                      child: Icon(
                    Icons.arrow_back_ios,
                    color: buttonColor,
                  )),
                ),
                const Text(
                  "  مرحله قبل",
                  style: TextStyle(color: buttonColor),
                ),
              ]),
            ),
          ),
          InkWell(
            onTap: onNext,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xffefefef),
              ),
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(children: [
                const Text(
                  "مرحله بعد  ",
                  style: TextStyle(color: buttonColor),
                ),
                CircleAvatar(
                  radius: MediaQuery.sizeOf(context).width / 20,
                  backgroundColor: Colors.white,
                  child: const Center(
                      child: Icon(
                    Icons.arrow_forward_ios,
                    color: buttonColor,
                  )),
                ),
              ]),
            ),
          ),
        ]),
      ],
    );
  }
}
