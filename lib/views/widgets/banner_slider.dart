import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          initialPage: 1,
          // height: MediaQuery.of(context).size.height / 4.5
          enableInfiniteScroll: true,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          viewportFraction: 0.6,
          enlargeCenterPage: true),
      items: List.generate(
          3,
          (index) => InkWell(
                child: Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.only(left: 5),
                    width: MediaQuery.of(context).size.width / 1.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://loremflickr.com/32$index/24$index",
                          ),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "خدمت $index",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 30,
                                color: Colors.white),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width / 15,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.white, width: 1.0),
                              ),
                              child: Center(
                                  child: Icon(Icons.arrow_forward,
                                      size: MediaQuery.of(context).size.width /
                                          20,
                                      color: Colors.white))),
                        ],
                      ),
                    )),
              )),
    );
  }
}
