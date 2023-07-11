import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(children: [
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              reverse: true,
              itemBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: index % 2 == 0
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.grey[300] : Colors.blue,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(10.0),
                        topRight: const Radius.circular(10.0),
                        bottomRight: index % 2 == 0
                            ? const Radius.circular(10.0)
                            : Radius.zero,
                        bottomLeft: index % 2 == 0
                            ? Radius.zero
                            : const Radius.circular(10.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'سلام! چگونه میتوانم به شما کمک کنم؟',
                          style: TextStyle(
                              color:
                                  index % 2 == 0 ? Colors.black : Colors.white),
                        ),
                        Text(
                          DateTime.now().hour.toString() +
                              ':' +
                              DateTime.now().minute.toString(),
                          style: TextStyle(
                              color:
                                  index % 2 == 0 ? Colors.black : Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: Get.height / 15,
                    child: TextFormField(
                      textInputAction: TextInputAction.done,
                      textAlignVertical: TextAlignVertical.bottom,
                      maxLines: 2,
                      style: TextStyle(fontSize: Get.width / 30),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2) +
                            const EdgeInsets.symmetric(horizontal: 5),
                        focusColor: Colors.green,
                        alignLabelWithHint: true,
                        suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.send,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                        hintText: 'پیام خود را بنویس',
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
