import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:rayaniyaresh/models/constants/urls.dart';

class PdfService {
  Future<Uint8List> init(
      {required String name,
      required String fatherName,
      required String birthday,
      required String nn,
      required String picture,
      required String formCode,
      required String nn2}) async {
    // Create the PDF document
    final pdf = pw.Document();

    final imageBytes1 =
        (await NetworkAssetBundle(Uri.parse(baseUrl + '/uploads/' + picture))
                .load(''))
            .buffer
            .asUint8List();

    // Create MemoryImage
    final image = pw.Image(pw.MemoryImage(imageBytes1),
        width: 80, height: 110, fit: pw.BoxFit.fill);

    // Repeat for second image
    final imageBytes = await rootBundle.load('assets/images/images/stamp.png');

    final stamp = pw.Image(pw.MemoryImage(imageBytes.buffer.asUint8List()),
        width: 100, height: 40, fit: pw.BoxFit.fill);

    final fonts =
        pw.Font.ttf(await rootBundle.load('assets/fonts/bnazanin.TTF'));

    final pw.Page page1 = pw.Page(
      // textDirection: pw.TextDirection.rtl,
      margin: const pw.EdgeInsets.all(25),
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.SizedBox(height: 10),
              pw.SizedBox(
                  width: double.maxFinite,
                  // height: 160,
                  child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                            "شماره: $formCode\nتاریخ:${DateTime.now().toPersianDate()}\nپیوست:..................",
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(
                                lineSpacing: 5,
                                fontFallback: [fonts],
                                font: fonts)),
                        pw.Expanded(
                            child: pw.Text("بسمه تعالی",
                                textDirection: pw.TextDirection.rtl,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    fontFallback: [fonts],
                                    font: fonts,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20))),
                        pw.SizedBox(
                            width: 100,
                            height: 140,
                            child: pw.Stack(children: [
                              pw.Align(
                                  alignment: pw.Alignment.topCenter,
                                  child: image),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: stamp),
                            ]))
                      ])),
              pw.SizedBox(height: 35),
              pw.Text("سرپرست محترم تشخیص هویت",
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      fontFallback: [fonts],
                      font: fonts,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20)),
              pw.SizedBox(height: 25),
              pw.SizedBox(
                  width: double.maxFinite,
                  child: pw.Text(
                      "باسلام\nاحتراما شرکت آسیا سلامت اندیشان البرز خانم / آقا $name فرزند $fatherName متولد $birthday به شماره شناسنامه $nn و کد ملی $nn2 را جهت جهت تاییده عدم سابقه کیفری به حضورتان معرفی میگردد.",
                      textDirection: pw.TextDirection.rtl,
                      textAlign: pw.TextAlign.justify,
                      style: pw.TextStyle(
                          lineSpacing: 20,
                          fontFallback: [fonts],
                          font: fonts,
                          fontSize: 16))),
              pw.SizedBox(height: 35),
              pw.Text(
                  ("کرج: رجایی شهر خیابان آزادی نبش 6 شرقی فاز ۱پلاک186 واحد 1"
                          "\nکد پستی: 3146983353")
                      .toPersianDigit(),
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      lineSpacing: 10,
                      fontFallback: [fonts],
                      font: fonts,
                      fontSize: 12)),
              pw.SizedBox(height: 35),
              pw.SizedBox(
                  width: 1000,
                  child: pw.Text("با تشکر",
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(
                        fontFallback: [fonts],
                        font: fonts,
                      ),
                      textAlign: pw.TextAlign.left)),
              pw.SizedBox(height: 25),
            ]);
      },
    );

    final pw.Page page2 = pw.Page(
      // textDirection: pw.TextDirection.rtl,
      margin: const pw.EdgeInsets.all(25),
      pageFormat: PdfPageFormat.a5,
      build: (pw.Context context) {
        return pw.Column(
            // mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.SizedBox(height: 10),
              pw.SizedBox(
                  width: double.maxFinite,
                  // height: 160,
                  child: pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                            "شماره: $formCode\nتاریخ:${DateTime.now().toPersianDate()}\nپیوست:..................",
                            textDirection: pw.TextDirection.rtl,
                            style: pw.TextStyle(
                                lineSpacing: 5,
                                fontFallback: [fonts],
                                font: fonts)),
                        pw.Expanded(
                            child: pw.Text("بسمه تعالی",
                                textDirection: pw.TextDirection.rtl,
                                textAlign: pw.TextAlign.center,
                                style: pw.TextStyle(
                                    fontFallback: [fonts],
                                    font: fonts,
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20))),
                        pw.SizedBox(
                            width: 100,
                            height: 140,
                            child: pw.Stack(children: [
                              pw.Align(
                                  alignment: pw.Alignment.topCenter,
                                  child: image),
                              pw.Align(
                                  alignment: pw.Alignment.bottomCenter,
                                  child: stamp),
                            ]))
                      ])),
              pw.SizedBox(height: 35),
              pw.Text("سرپرست محترم آزمایشگاه:",
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      fontFallback: [fonts],
                      font: fonts,
                      fontWeight: pw.FontWeight.bold,
                      fontSize: 20)),
              pw.SizedBox(height: 25),
              pw.SizedBox(
                  width: double.maxFinite,
                  child: pw.Text(
                      "باسلام\nاحتراما شرکت آسیا سلامت اندیشان البرز خانم / آقا $name فرزند $fatherName متولد $birthday به شماره شناسنامه $nn و کد ملی $nn2 را جهت انجام آزمایش عدم اعتیاد به حضورتان معرفی میگردد.",
                      textDirection: pw.TextDirection.rtl,
                      textAlign: pw.TextAlign.justify,
                      style: pw.TextStyle(
                          lineSpacing: 20,
                          fontFallback: [fonts],
                          font: fonts,
                          fontSize: 16))),
              pw.SizedBox(height: 35),
              pw.Text(
                  ("کرج: رجایی شهر خیابان آزادی نبش 6 شرقی فاز ۱پلاک186 واحد 1"
                          "\nکد پستی: 3146983353")
                      .toPersianDigit(),
                  textDirection: pw.TextDirection.rtl,
                  style: pw.TextStyle(
                      lineSpacing: 10,
                      fontFallback: [fonts],
                      font: fonts,
                      fontSize: 12)),
              pw.SizedBox(height: 35),
              pw.SizedBox(
                  width: 1000,
                  child: pw.Text("با تشکر",
                      textDirection: pw.TextDirection.rtl,
                      style: pw.TextStyle(
                        fontFallback: [fonts],
                        font: fonts,
                      ),
                      textAlign: pw.TextAlign.left)),
              pw.SizedBox(height: 25),
            ]);
      },
    );

    // Add to document
    pdf.addPage(page1);
    pdf.addPage(page2);

    return await pdf.save();
  }
}
