import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rayaniyaresh/models/constants/colors.dart';
import 'package:rayaniyaresh/views/widgets/banner_slider.dart';
import 'package:rayaniyaresh/views/widgets/service_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              // search input
              Padding(
                padding: EdgeInsets.only(
                    top: 20, bottom: MediaQuery.of(context).size.height * 0.05),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 18,
                    child: TextField(
                      onChanged: (value) {
                        // if (value.isEmpty) {
                        //   _controller.categories.value =
                        //       _controller.allSearchCategories;
                        // } else {
                        //   _controller.categories.value = [];
                        //   for (var element in _controller
                        //       .allCategories.data.categories) {
                        //     print(element.subCategory);
                        //     for (var sub in element.subCategory) {
                        //       if ((sub.title ?? "").contains(value)) {
                        //         _controller.categories.add(SearchModel(
                        //             id: sub.id,
                        //             title: sub.title ?? "",
                        //             image: sub.image ?? "",
                        //             description: sub.description ?? "",
                        //             isCategory: false));
                        //       }
                        //     }
                        //   }
                        // }
                      },
                      maxLines: 1,
                      style: const TextStyle(fontSize: 12),
                      decoration: InputDecoration(
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Color(0xff005D67),
                        ),
                        hintText: "جستجوی خدمت",
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: purple)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: purple)),
                      ),
                    )),
              ),

              // categories
              SizedBox(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height / 2.5,
                height: MediaQuery.of(context).size.width / 3.3 * (9 ~/ 2),
                child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: MediaQuery.of(context).size.height / 6.8,
                      mainAxisSpacing: MediaQuery.of(context).size.width / 40,
                      crossAxisSpacing: MediaQuery.of(context).size.width / 30,
                    ),
                    itemCount: 9,
                    // itemCount: 7,
                    // _controller.categories.data.categories.length,
                    itemBuilder: (context, index) => ServiceWidget(
                          isImageAsset: false,
                          onTap: () {
                            FocusScope.of(context).unfocus();
                          },
                          image: "https://loremflickr.com/320/240",
                          title: "خدمت $index",
                        )),
              ),

              // favorites services
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        "خدمات محبوب",
                        style: TextStyle(
                            color: const Color(0xff252525),
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width / 26),
                      ),
                    ),
                    Expanded(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: const BannerSlider(),
                    ))
                  ],
                ),
              ),

              SizedBox(
                height: Get.height / 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
