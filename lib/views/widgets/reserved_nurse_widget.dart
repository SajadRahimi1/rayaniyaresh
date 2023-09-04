import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/models/request_nurse_model.dart';
import 'package:rayaniyaresh/models/extensions/enum_extension.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class ReservedNurseWidget extends StatelessWidget {
  const ReservedNurseWidget(
      {Key? key,
      this.onTap,
      this.evalation,
      this.model,
      this.isReserved = false})
      : super(key: key);
  final void Function()? onTap;
  final double? evalation;
  final RequestNurseModel? model;
  final bool isReserved;
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
          height: MediaQuery.of(context).size.height / 5.2,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // expertise
                Row(
                  children: [
                    const Icon(
                      Icons.local_pharmacy,
                      color: Color(0xffa0a0a0),
                    ),
                    const Text(" نوع پرستار: "),
                    Text(
                      model?.nurseCategory.titleFromEnum() ?? "",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: MediaQuery.of(context).size.width / 28,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                // cards
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 22,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        model?.shift == Shift.Boarding
                            ? const SizedBox()
                            : Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(left: 5),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff62E067)),
                                child: Text(
                                  model?.hours ?? "",
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        MediaQuery.of(context).size.width / 30,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color(0xff62E067)),
                          child: Text(
                            model?.shift.getString() ?? "",
                            style: TextStyle(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.bold,
                              fontSize: MediaQuery.of(context).size.width / 30,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ]),
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Color(0xffa0a0a0),
                    ),
                    const Text(" تاریخ درخواست: "),
                    Expanded(
                      child: Text(
                        model?.createdAt?.toPersianDate() ?? "",
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: MediaQuery.of(context).size.width / 28,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                // location text
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xffa0a0a0),
                    ),
                    Expanded(
                      child: Text(
                        model?.address ?? "",
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: MediaQuery.of(context).size.width / 28,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
