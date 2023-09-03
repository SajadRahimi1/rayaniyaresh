import 'dart:io';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:path_provider/path_provider.dart';

class PdfService {
  Future<void> init() async {
    // Create the PDF document
    final pdf = pw.Document();

    final imageBytes1 = (await NetworkAssetBundle(Uri.parse(
                'http://192.168.1.8:8050/uploads/educational2_f40b7afc-7805-430d-bfab-58d2c708664f.png'))
            .load(''))
        .buffer
        .asUint8List();

// Create MemoryImage
    final topLeftImage = pw.Image(pw.MemoryImage(imageBytes1),
        width: 100, height: 100, fit: pw.BoxFit.fill);

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

    final fonts = pw.Font.ttf(await rootBundle.load('assets/fonts/sans.ttf'));

// Add to document
    pdf.addPage(pw.Page(
      textDirection: pw.TextDirection.rtl,
      margin: const pw.EdgeInsets.all(25),
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.SizedBox(
                  width: double.maxFinite,
                  height: 250,
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.SizedBox(
                            height: 200,
                            width: 120,
                            child: pw.Stack(
                                children: [topLeftImage, paddedImage])),
                        pw.Text(
                            'تاریخ: ' +
                                DateTime.now().toPersianDate() +
                                '\nشماره: ' +
                                '12514',
                            style: pw.TextStyle(
                                fontFallback: [fonts], font: fonts),
                            textDirection: pw.TextDirection.rtl,
                            textAlign: pw.TextAlign.right),
                      ])),
              pw.Expanded(
                  child: pw.Text(
                      "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد کتابهای زیادی در شصت و سه درصد گذشته حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد در این صورت می توان امید داشت که تمام و دشواری موجود در اراه راهکارها و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد",
                      style: pw.TextStyle(fontFallback: [fonts], font: fonts),
                      textDirection: pw.TextDirection.rtl))
            ]);
      },
    ));

    pdf.addPage(pw.Page(
      build: (pw.Context context) => paddedImage,
    ));
    var path = await getApplicationSupportDirectory();
    print(path.path);
// Save the PDF
    File((path.path ?? "") + '/my_doc.pdf').writeAsBytesSync(await pdf.save());
  }
}
