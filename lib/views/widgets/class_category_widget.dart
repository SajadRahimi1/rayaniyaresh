import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

class ClassCategoryWidget extends StatelessWidget {
  const ClassCategoryWidget(
      {Key? key,
      this.onTap,
      this.enable = false,
      required this.title,
      required this.image})
      : super(key: key);
  final void Function()? onTap;
  final bool enable;
  final String? title, image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomRight,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            // color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
            image: image == null
                ? null
                : DecorationImage(
                    image: NetworkImage(imagebaseUrl + (image ?? "")),
                    fit: BoxFit.fill)),
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 4, right: 8, left: 8),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, .7),
                    Color.fromRGBO(0, 0, 0, 0.2),
                  ])),
          child: Text(
            title ?? "",
            maxLines: 1,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width / 28,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
