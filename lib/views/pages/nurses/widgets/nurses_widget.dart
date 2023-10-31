import 'package:flutter/material.dart';
import 'package:rayaniyaresh/models/models/get_nurse_model.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class NursesWidget extends StatelessWidget {
  const NursesWidget({
    Key? key,
    this.onTap,
    required this.model,
  }) : super(key: key);
  final void Function()? onTap;
  final GetNurseModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5.5,
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
                    Text(
                      "نام: ",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: MediaQuery.of(context).size.width / 30,
                      ),
                    ),
                    Text(
                      model.name ?? '',
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: MediaQuery.of(context).size.width / 30,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                // cards
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 24,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: model.shift?.split(',').length ?? 0,
                      itemBuilder: (_, index) => (model.shift
                                  ?.split(',')[index]
                                  .isEmpty ??
                              true)
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
                                model.shift?.split(',')[index] ?? '',
                                style: TextStyle(
                                  color: const Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 33,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                    )),

                // date request
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_month,
                      color: Color(0xffa0a0a0),
                    ),
                    Text(
                      " تاریخ درخواست: ",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontSize: MediaQuery.of(context).size.width / 30,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        model.createdAt?.toPersianDate() ?? "",
                        style: TextStyle(
                          color: const Color(0xff000000),
                          fontSize: MediaQuery.of(context).size.width / 30,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                if (model.authority != null)
                  Container(
                    width: MediaQuery.sizeOf(context).width / 4,
                    height: MediaQuery.sizeOf(context).height / 24,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xff62E067)),
                    child: Text(
                      "دانلود فرم",
                      style: TextStyle(
                        color: const Color(0xff000000),
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.width / 33,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
