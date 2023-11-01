import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

class NurseInformationWidget extends StatelessWidget {
  const NurseInformationWidget({
    Key? key,
    required this.title,
    required this.value,
    this.isAddress = false,
    this.showEditIcon = false,
    this.isPayment = false,
    this.onEditTap,
  }) : super(key: key);
  final String title, value;
  final bool isPayment, isAddress, showEditIcon;
  final void Function()? onEditTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: isAddress ? null : MediaQuery.sizeOf(context).height / 16,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black)),
      child: Row(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEditIcon)
              InkWell(
                onTap: onEditTap,
                child: const Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )),
        const VerticalDivider(
          color: Colors.black,
        ),
        if (isPayment)
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: const TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              if (value == "پرداخت شده")
                const Icon(
                  Icons.check,
                  color: Colors.green,
                )
              else if (value == "درحال بررسی")
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                )
              else
                const Icon(
                  Icons.close,
                  color: Colors.red,
                )
            ],
          ))
        else
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(
              value,
              style: const TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ))
      ]),
    );
  }
}

class NurseImageWidget extends StatelessWidget {
  const NurseImageWidget({Key? key, required this.title, required this.value})
      : super(key: key);
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) =>
      //           ShowImageScreen(src: '$baseUrl/uploads/$value'),
      //     )),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height / 6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            border: Border.all(color: Colors.black)),
        child: Row(children: [
          Expanded(
              child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
            ),
          )),
          const VerticalDivider(
            color: Colors.black,
          ),
          Expanded(child: Image.network('$baseUrl/uploads/$value'))
        ]),
      ),
    );
  }
}

class NurseProblemWidget extends StatelessWidget {
  const NurseProblemWidget(
      {Key? key,
      required this.title,
      required this.value,
      this.showEditIcon = false})
      : super(key: key);
  final String title, value;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    final catgories =
        value.split('.').where((element) => element.isNotEmpty).toList();

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: (MediaQuery.sizeOf(context).height / 25) * catgories.length,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black)),
      child: Row(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEditIcon)
              const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )),
        const VerticalDivider(
          color: Colors.black,
        ),
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(
                    catgories.length, (index) => Text(catgories[index]))))
      ]),
    );
  }
}

class NurseCategoryWidget extends StatelessWidget {
  const NurseCategoryWidget(
      {Key? key,
      required this.title,
      required this.value,
      this.showEditIcon = false})
      : super(key: key);
  final String title, value;
  final bool showEditIcon;

  @override
  Widget build(BuildContext context) {
    final catgories =
        value.split(',').where((element) => element.isNotEmpty).toList();

    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: (MediaQuery.sizeOf(context).height / 25) * catgories.length,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(color: Colors.black)),
      child: Row(children: [
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showEditIcon)
              const Icon(
                Icons.edit,
                color: Colors.green,
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        )),
        const VerticalDivider(
          color: Colors.black,
        ),
        Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(catgories.length,
                    (index) => Text(getCategory(catgories[index])))))
      ]),
    );
  }
}

String getCategory(String category) {
  if (category.contains('Oldage')) return "سالمند";
  if (category.contains('Kid')) return "کودک";
  if (category.contains('Patient')) return "بیمار";
  return "";
}
