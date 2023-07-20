import 'package:flutter/material.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseRulesScreen extends StatelessWidget {
  const NurseRulesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context, title: "شرایط و قوانین"),
    );
  }
}
