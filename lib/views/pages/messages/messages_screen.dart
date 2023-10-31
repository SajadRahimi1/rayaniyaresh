import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/extensions/date_time_extension.dart';
import 'package:rayaniyaresh/models/models/user_model.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: 'پیام ها'),
      body: ListView.builder(
          itemCount: messages.length,
          itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  tileColor: const Color(0xffefefef),
                  title: Text(messages[index].content ?? ''),
                  subtitle: Text((messages[index].createdAt ?? DateTime.now())
                      .getHourMinute()
                      .toPersianDigit()),
                ),
              )),
    );
  }
}
