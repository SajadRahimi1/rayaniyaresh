import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutusScreen extends StatelessWidget {
  const AboutusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffe6e6e6),
        appBar: AppBar(
          backgroundColor: const Color(0xffF8FAFB),
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 5,
              child: Image.asset("assets/images/images/logo.png"),
            ),
            Container(
              height: Get.height / 1.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xffffffff),
              ),
              padding:
                  const EdgeInsets.all(10) + const EdgeInsets.only(top: 10),
              child: const Text(
                """رایانی یارشکرا، یک شرکت فعال در زمینه فروش و خدمات کامپیوتری و شبکه‌های کامپیوتری است. این شرکت با بیش از ده سال تجربه در این صنعت، به عنوان یکی از معتبرترین شرکت‌های فعال در این حوزه شناخته می‌شود.
ما در رایانی یارشکرا، با تکیه بر تجربه و دانش فنی کارکنان خود، به ارائه خدماتی با کیفیت بالا در زمینه طراحی و پیاده‌سازی شبکه‌های کامپیوتری، فروش سخت‌افزار و نرم‌افزار، مشاوره فناوری اطلاعات و خدمات پس از فروش می‌پردازیم.
با توجه به تحولات روزافزون تکنولوژی و نیازهای رو به رشد کاربران، ما در رایانی یارشکرا، به دنبال ارائه خدمات و راهکارهایی متناسب با نیازهای شما هستیم. هدف ما در رایانی یارشکرا، ارائه خدماتی با کیفیت بالا و ارزان قیمت به مشتریانمان است.
اگر به دنبال یک شرکت مطمئن و قابل اعتماد در زمینه خدمات کامپیوتری و شبکه‌های کامپیوتری هستید، با ما تماس بگیرید و از تجربه و دانش ما بهره‌مند شوید.

با احترام،
تیم رایانیارش کارا""",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
