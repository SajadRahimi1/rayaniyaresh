import 'package:flutter/material.dart';

class YesNoWidget extends StatelessWidget {
  const YesNoWidget(
      {Key? key, required this.value, required this.title, this.onChanged})
      : super(key: key);
  final bool value;
  final String title;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 10,
        child: Row(children: [
          Expanded(
            flex: 8,
            child: Text(
              title,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width / 31),
            ),
          ),
          Expanded(
            flex: 2,
            child: DropdownButton(
                items: List.generate(
                    2,
                    (index) => DropdownMenuItem<bool>(
                          child: Text(["خیر", "بلی"][index]),
                          value: [false, true][index],
                        )),
                value: value,
                elevation: 5,
                // style: TextStyle(fontSize: Get.width / 23),
                onChanged: onChanged),
          ),
        ]));
  }
}
