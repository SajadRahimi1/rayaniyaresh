import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/views/widgets/nurse_widget.dart';

class NurseDetailScreen extends StatelessWidget {
  const NurseDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8FAFB),
        title: const Text(
          "جزییات پرستار",
          style: TextStyle(color: Color(0xff000000), fontSize: 18),
        ),
        centerTitle: true,
        // leading: const Icon(Icons.more_vert, color: Color(0xff000000)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Color(0xff000000)),
            onPressed: () => Get.back(),
          )
        ],
      ),
      body: Column(
        children: [
          // all item except button
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Get.height / 25,
                    ),
                    child: const NurseWidget(
                      evalation: 0,
                    )),
                Text(
                  "درباره",
                  style: TextStyle(
                    color: const Color(0xff000000),
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.width / 27,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: const Color(0xffa0a0a0),
                    fontSize: MediaQuery.of(context).size.width / 28,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: Get.height / 20),
                  child: SizedBox(
                    width: Get.width,
                    height: Get.height / 9,
                    child: ListView.builder(
                      itemCount: 7,
                      itemExtent: Get.width / 5,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => InkWell(
                          // onTap: () => _controller
                          //     .selectedDateIndex
                          //     .value = index,
                          child: Container(
                        // width: MediaQuery.of(
                        //             context)
                        //         .size
                        //         .width /
                        //     5,
                        height: MediaQuery.of(context).size.height,
                        margin: EdgeInsets.only(left: 5),
                        decoration: const BoxDecoration(
                          color: const Color(0xffF5F5F5),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Center(
                            child: Text(
                          "\t" +
                              [
                                "شنبه",
                                "یکشنبه",
                                "دوشنبه",
                                "سه شنبه",
                                "چهارشنبه",
                                "پنجشنبه",
                                "جمعه",
                              ][index] +
                              "\t",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width / 32),
                        )),
                      )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // button
          Container(
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height / 13.5,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Text(
              "رزرو پرستار",
              style: TextStyle(
                  fontSize: Get.width / 24,
                  color: Color(0xffffffff),
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
