import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6,
          vertical: MediaQuery.of(context).size.height / 2.7),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(``
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14), color: Colors.white),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // cash pay
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/icons/cash.png",
                  width: MediaQuery.of(context).size.width / 4,
                ),
                Text(
                  "پرداخت نقدی \n(آنلاین)",
                  textAlign: TextAlign.center,
                )
              ],
            ),

            // splitter
            Container(
              width: 1,
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
            ),
            // installment pay
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/icons/installment.png",
                  width: MediaQuery.of(context).size.width / 4.5,
                ),
                Text(
                  "پرداخت اقساط \n(آنلاین)",
                  textAlign: TextAlign.center,
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
