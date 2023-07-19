import 'package:flutter/material.dart';
import 'package:rayaniyaresh/views/widgets/appbar_widget.dart';

class NurseUploadsScreen extends StatelessWidget {
  const NurseUploadsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: screensAppbar(context: context),
    );
  }
}
