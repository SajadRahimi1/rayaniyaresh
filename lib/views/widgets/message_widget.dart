import 'package:flutter/material.dart';

class Messagewidget extends StatelessWidget {
  const Messagewidget(
      {Key? key,
      required this.isUserSend,
      required this.text,
      required this.time,
      required this.messageIcon})
      : super(key: key);
  final bool isUserSend;
  final String text, time;
  final Icon messageIcon;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isUserSend ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        // padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isUserSend ? Colors.blue : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            topRight: const Radius.circular(10.0),
            bottomRight: isUserSend ? Radius.zero : const Radius.circular(10.0),
            bottomLeft: isUserSend ? const Radius.circular(10.0) : Radius.zero,
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: RegExp(r'^[\u0600-\u06FF\s]+$').hasMatch(text)
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 28,
                      color: isUserSend ? Colors.white : Colors.black),
                ),
                Row(
                  children: [
                    messageIcon,
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 26,
                          color: isUserSend ? Colors.white : Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
