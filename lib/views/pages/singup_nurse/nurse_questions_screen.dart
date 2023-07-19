import 'package:flutter/material.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseQuestionScreen extends StatelessWidget {
  const NurseQuestionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context,title: "استخدام پرستار"),
      body: ListView(
        children: [
          Column(
            children: [
              
            ],
          )
        ],
      ),
    );
  }
}
