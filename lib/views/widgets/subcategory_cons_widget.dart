import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ConsWidget extends StatelessWidget {
  const ConsWidget({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Image.asset(
          image,
          width: MediaQuery.of(context).size.width / 10,
        ),
        title: Text(
          title.toPersianDigit(),
        ),
      ),
    );
  }
}
