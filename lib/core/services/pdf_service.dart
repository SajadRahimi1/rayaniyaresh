import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:rayaniyaresh/core/services/message_service.dart';

class PdfService {
  Future<void> init(
      {required String name,
      required String fatherName,
      required String birthday,
      required String nn,
      bool isAddicionForm = true,
      required String nn2}) async {
    // Create the PDF document
    final pdf = pw.Document();

    final imageBytes1 = (await NetworkAssetBundle(Uri.parse(
                'http://192.168.1.8:8050/uploads/educational2_f40b7afc-7805-430d-bfab-58d2c708664f.png'))
            .load(''))
        .buffer
        .asUint8List();

    // Create MemoryImage
    final image = pw.Image(pw.MemoryImage(imageBytes1),
        width: 80, height: 110, fit: pw.BoxFit.fill);

    // Repeat for second image
    final imageBytes2 = (await NetworkAssetBundle(Uri.parse(
                'http://192.168.1.8:8050/uploads/educational2_f40b7afc-7805-430d-bfab-58d2c708664f.png'))
            .load(''))
        .buffer
        .asUint8List();

    final paddedImage = pw.Padding(
      padding: const pw.EdgeInsets.only(top: 80, left: 70),
      child: pw.Image(pw.MemoryImage(imageBytes2),
          width: 60, height: 60, fit: pw.BoxFit.fill),
    );

    final fonts =
        pw.Font.ttf(await rootBundle.load('assets/fonts/bnazanin.TTF'));

    // Add to document
    pdf.addPage(pw.Page(
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
                            "شماره: 6000\nتاریخ:${DateTime.now().toPersianDate()}\nپیوست:..................",
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
                        image
                      ])),
              pw.SizedBox(height: 35),
              pw.Text(
                  isAddicionForm
                      ? "سرپرست محترم آزمایشگاه:"
                      : "سرپرست محترم تشخیص هویت",
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
                      "باسلام\nاحتراما شرکت آسیا سلامت اندیشان البرز خانم / آقا $name فرزند $fatherName متولد $birthday به شماره شناسنامه $nn و کد ملی $nn2 را جهت ${isAddicionForm ? "انجام آزمایش عدم اعتیاد" : "جهت تاییده عدم سابقه کیفری"} به حضورتان معرفی میگردد.",
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
    ));

    var path = await FilePicker.platform.getDirectoryPath();
    // Save the PDF
    if (path != null) {
      File(path + '/my_doc.pdf').writeAsBytesSync(await pdf.save());
    } else {
      showMessage(
          title: 'خطا',
          message:
              'حتما با این دو فرم در در حافظه خود ذخیره کنید تا بتوانید آن را پرینت کنید',
          type: MessageType.error);
    }
  }
}
