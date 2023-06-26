import 'package:flutter/material.dart';

class ServiceWidget extends StatelessWidget {
  const ServiceWidget(
      {Key? key,
      this.onTap,
      required this.image,
      required this.title,
      required this.isImageAsset})
      : super(key: key);
  final void Function()? onTap;
  final String image, title;
  final bool isImageAsset;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 7,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Container(
            width: MediaQuery.of(context).size.width / 5.5,
            height: MediaQuery.of(context).size.width / 4,
            decoration: const BoxDecoration(
              color: Color(0xfffcfcfc),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: image.isNotEmpty && isImageAsset
                        ? SizedBox.square(
                            dimension: MediaQuery.of(context).size.width / 10,
                            child: Image.asset(
                              "assets/images/icons/$image.png",
                              fit: BoxFit.contain,
                              filterQuality: FilterQuality.medium,
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(image
                                  // fit: BoxFit.cover,
                                  ),
                            ),
                          )),
                Expanded(
                    child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 32,
                  ),
                ))
              ],
            )),
      ),
    );
  }
}
