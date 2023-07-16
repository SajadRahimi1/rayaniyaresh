import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/viewmodels/home/support_viewmodel.dart';
import 'package:rayaniyaresh/views/widgets/message_icon_widget.dart';
import 'package:rayaniyaresh/views/widgets/message_widget.dart';

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
                  child: Obx(
                () => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller.scrollController,
                  reverse: true,
                  itemCount: _controller.messagesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Messagewidget(
                        isUserSend:
                            _controller.messagesList[index].isUserSend ?? true,
                        text: _controller.messagesList[index].content ?? "",
                        time: (_controller.messagesList[index].createdAt ??
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
                        messageIcon: messageIcon(
                            _controller.messagesList[index].success ?? true,
                            _controller.messagesList[index].isSent ?? true,
                            _controller.messagesList[index].seen ?? false));
                  },
                ),
              )),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: Get.height / 15,
                        child: TextFormField(
                          controller: _controller.textEditingController,
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
                              onPressed: () async {
                                var message =
                                    _controller.textEditingController.text;
                                _controller.textEditingController.clear();
                                await _controller.sendMessage(message);
                              },
                            ),
                            hintText: 'پیام خود را بنویس',
                            border: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
