import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Models/database.dart';

final List<String> images = [
  'https://d2dfxqxblmblx4.cloudfront.net/wp-content/uploads/2016/01/18144431/SalonsServicesPremium_1200x940_v2.jpg',
  'https://production-next-images-cdn.thumbtack.com/i/322004416547373074/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/302055595217092758/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/358193030236708876/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/336969040313638933/width/320/aspect/8-5.webp'
];

class homeslider2 extends StatelessWidget {
  homeslider2({Key? key}) : super(key: key);

  final MainSlider2 mainSliderScroller2 = MainSlider2();
  ScrollController controller = ScrollController();
  bool closeMainSliderContainer = false;

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return Stack(
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: closeMainSliderContainer ? 0 : 1,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              width: size.width,
              alignment: Alignment.topCenter,
              height: closeMainSliderContainer ? 0 : categoryHeight,
              child: mainSliderScroller2),
        ),
        Consumer<Database>(
          builder: (context, value, child) {
            return Positioned(
              top: 170,
              left: 150,
              child: AnimatedSmoothIndicator(
                activeIndex: dbclass.activeIndex1,
                count: images.length,
                effect: ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Color(0XFF02C908)),
              ),
            );
          },
        )
      ],
    );
  }
}

class MainSlider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;

    return SizedBox(
      height: 200,
      child: Consumer<Database>(
        builder: (context, value, child) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 400.0,
              initialPage: 0,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlay: true,
              reverse: false,
              viewportFraction: 2.0,
              aspectRatio: 1.0,
              autoPlayInterval: Duration(seconds: 2),
              autoPlayAnimationDuration: Duration(milliseconds: 500),
              onPageChanged: (index, reason) {
                dbclass.indicator1(index);
                scrollDirection:
                Axis.horizontal;
              },
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: CachedNetworkImage(
                            imageUrl: i,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
