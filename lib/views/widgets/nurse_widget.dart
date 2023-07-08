import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/models/nurse_model.dart';

class NurseWidget extends StatelessWidget {
  const NurseWidget({Key? key, this.onTap, this.evalation, this.model}) : super(key: key);
  final void Function()? onTap;
  final double? evalation;
  final NurseModel? model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: evalation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5.6,
          child: Row(
            children: [
              // image
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200"))),
                  child: SizedBox.square(
                    dimension: MediaQuery.of(context).size.width / 3.2,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 18,
              ),
              // text an other
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // name
                      Text(
                        model?.name??"",
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontWeight: FontWeight.bold,
                          fontSize: MediaQuery.of(context).size.width / 25,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // expertise
                      Text(
                        "پرستار",
                        style: TextStyle(
                          color: Color(0xffa0a0a0),
                          fontSize: MediaQuery.of(context).size.width / 28,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // star rate
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 1),
                        width: MediaQuery.of(context).size.width / 6.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xff62E067)),
                        child: Row(children: [
                          const Icon(
                            Icons.star,
                            color: Colors.green,
                          ),
                          Text(
                           (model?.rating??0).toString(),
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 28,
                            ),
                            overflow: TextOverflow.ellipsis,
                          )
                        ]),
                      ),
                      // location text
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Color(0xffa0a0a0),
                          ),
                          Text(
                            model?.locations??"",
                            style: TextStyle(
                              color: const Color(0xffa0a0a0),
                              fontSize: MediaQuery.of(context).size.width / 28,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
