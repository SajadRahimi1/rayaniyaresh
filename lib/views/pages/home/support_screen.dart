import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/viewmodels/home/support_viewmodel.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(SupportViewModel());

    return Scaffold(
      body: _controller.obx((status) => SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(children: [
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller.scrollController,
                  reverse: true,
                  itemCount: _controller.messagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Align(
                      alignment:
                          _controller.messagesList[index].isUserSend ?? true
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color:
                              _controller.messagesList[index].isUserSend ?? true
                                  ? Colors.blue
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(10.0),
                            topRight: const Radius.circular(10.0),
                            bottomRight:
                                _controller.messagesList[index].isUserSend ??
                                        true
                                    ? Radius.zero
                                    : const Radius.circular(10.0),
                            bottomLeft:
                                _controller.messagesList[index].isUserSend ??
                                        true
                                    ? const Radius.circular(10.0)
                                    : Radius.zero,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _controller.messagesList[index].content ?? "",
                              style: TextStyle(
                                  color: _controller
                                              .messagesList[index].isUserSend ??
                                          true
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            Text(
                              (_controller.messagesList[index].createdAt ??
                                          DateTime.now())
                                      .toUtc()
                                      .hour
                                      .toString() +
                                  ':' +
                                  (_controller.messagesList[index].createdAt ??
                                          DateTime.now())
                                      .toUtc()
                                      .minute
                                      .toString(),
                              style: TextStyle(
                                  color: _controller
                                              .messagesList[index].isUserSend ??
                                          true
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                              icon: Icon(
                                Icons.send,
                                color: Colors.green,
                              ),
                              onPressed: () {
                                // final ScrollPosition position =
                                //     _controller.scrollController.position;
                                // position.animateTo(
                                //   position.maxScrollExtent,
                                //   duration: const Duration(milliseconds: 500),
                                //   curve: Curves.easeOut,
                                // );
                              },
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
          )),
    );
  }
}
