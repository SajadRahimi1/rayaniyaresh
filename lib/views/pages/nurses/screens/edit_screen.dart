import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        widget.title,
      )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(11.0),
            child: TextFormField(
              controller: textEditingController,
              maxLines: 5,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          InkWell(
            onTap: () => Navigator.pop(context, textEditingController.text),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 15,
              decoration: const BoxDecoration(
                  color: buttonColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              alignment: Alignment.center,
              child: const Text(
                "ذخیره",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
