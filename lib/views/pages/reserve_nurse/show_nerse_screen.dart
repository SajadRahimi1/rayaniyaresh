import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowNerseScreen extends StatelessWidget {
  const ShowNerseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffF8FAFB),
        title: const Text(
          "پرستار ها",
          style: TextStyle(color: Color(0xff000000)),
        ),
        centerTitle: true,
        leading: const Icon(Icons.more_vert, color: Color(0xff000000)),
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_forward, color: Color(0xff000000)),
            onPressed: () => Get.back(),
          )
        ],
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (_, index) => Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  width: Get.width,
                  height: Get.height / 5.6,
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
                            dimension: Get.width / 3.2,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height,
                        width: Get.width / 18,
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
                                "آقای سجاد رحیمی",
                                style: TextStyle(
                                  color: Color(0xff000000),
                                  fontWeight: FontWeight.bold,
                                  fontSize: Get.width / 25,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // expertise
                              Text(
                                "پرستار",
                                style: TextStyle(
                                  color: Color(0xffa0a0a0),
                                  fontSize: Get.width / 28,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              // star rate
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 1),
                                width: Get.width / 6.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: const Color(0xff62E067)),
                                child: Row(children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.green,
                                  ),
                                  Text(
                                    " 4.5",
                                    style: TextStyle(
                                      color: const Color(0xff000000),
                                      fontWeight: FontWeight.bold,
                                      fontSize: Get.width / 28,
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
                                    " البرز / کرج",
                                    style: TextStyle(
                                      color: const Color(0xffa0a0a0),
                                      fontSize: Get.width / 28,
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
              )),
    );
  }
}
