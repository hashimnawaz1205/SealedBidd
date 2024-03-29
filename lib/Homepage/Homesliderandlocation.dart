import 'package:cached_network_image/cached_network_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/Models/database.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Models/CityApi.dart';
import '../SearchPage.dart';
import 'NetworkTypeAheadPage.dart';

final List<String> images = [
  'https://d2dfxqxblmblx4.cloudfront.net/wp-content/uploads/2016/01/18144431/SalonsServicesPremium_1200x940_v2.jpg',
  'https://production-next-images-cdn.thumbtack.com/i/322004416547373074/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/302055595217092758/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/358193030236708876/width/320/aspect/8-5.webp',
  'https://production-next-images-cdn.thumbtack.com/i/336969040313638933/width/320/aspect/8-5.webp'
];

class homeslider extends StatelessWidget {
  var scaffoldKey;

  homeslider({Key? key, required this.scaffoldKey}) : super(key: key);

  final MainSlider mainSliderScroller = MainSlider();
  ScrollController controller = ScrollController();
  bool closeMainSliderContainer = false;
  final TextEditingController typeAheadController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();

    context.read<Database>().getRecentCity();
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.40;
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeMainSliderContainer ? 0 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 800),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeMainSliderContainer ? 0 : categoryHeight,
                child: mainSliderScroller),
          ),
          Positioned(
            left: 30,
            top: 25,
            child: GestureDetector(
              onTap: () => scaffoldKey.currentState!.openDrawer(),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).backgroundColor,
                child: Icon(Icons.apps_sharp,
                    color: Theme.of(context).primaryColor),
              ),
            ),
          ),
          const Positioned(
            right: 30,
            top: 25,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.notifications_outlined,
                color: Color(0XFF02C908),
              ),
            ),
          ),
          // Positioned(
          //   top: 180,
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 50,
          //         width: MediaQuery.of(context).size.width * 0.75,
          //         margin: const EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(18),
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.5),
          //               spreadRadius: 5,
          //               blurRadius: 7,
          //               offset:
          //                   const Offset(0, 3), // changes position of shadow
          //             ),
          //           ],
          //         ),
          //         child: Padding(
          //           padding: const EdgeInsets.all(8.0),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Icon(Icons.location_on, color: Color(0XFF02C908)),
          //               Text(
          //                 'G-12 Islamabad',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 12,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF6C757D),
          //                 ),
          //               ),
          //               Icon(
          //                 Icons.gps_fixed,
          //                 color: Color(0XFF6C757D),
          //               )
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         height: 50,
          //         width: MediaQuery.of(context).size.width * 0.15,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(18),
          //           color: Colors.white,
          //           boxShadow: [
          //             BoxShadow(
          //               color: Colors.grey.withOpacity(0.5),
          //               spreadRadius: 5,
          //               blurRadius: 7,
          //               offset:
          //                   const Offset(0, 3), // changes position of shadow
          //             ),
          //           ],
          //         ),
          //         child: const Icon(
          //           Icons.search,
          //           color: Color(0XFF02C908),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          Positioned(
            top: 180,
            child: Container(
              margin: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.96,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xffd4d4d9),
                      spreadRadius: 0.5,
                      blurRadius: 5.0),
                ],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0)),
                border: Border.all(
                  color: Colors.black12,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => SearchPage(),
                            ),
                          );
                        },
                        child: Consumer(
                          builder: (context, value, child) {
                            return const SizedBox(
                                height: 50,
                                width: 200,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 8.0, top: 15.0),
                                  child: Text('Type Search Here'),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Theme.of(context).primaryColor,
                      ),
                      InkWell(
                        onTap: () async {
                          print('your inkwell has been hit !');
                          // await dbclass.getPermission();
                          // dbclass.getCurrentlocation();
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                    title: const Text('Select City'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: [
                                          ListTile(
                                            title:
                                                const Text('Get City From Gps'),
                                            trailing: const Icon(
                                              Icons.gps_fixed,
                                              color: Colors.blue,
                                            ),
                                            onTap: () async {
                                              await dbclass.getPermission();
                                              dbclass.getCurrentlocation();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            child: TypeAheadFormField<City?>(
                                              hideSuggestionsOnKeyboardHide:
                                                  false,
                                              textFieldConfiguration:
                                                  TextFieldConfiguration(
                                                focusNode: FocusScopeNode(),
                                                enableSuggestions: false,
                                                autofocus: false,
                                                controller:
                                                    typeAheadController2,
                                                decoration: InputDecoration(
                                                  hintStyle:
                                                      GoogleFonts.montserrat(),
                                                  border:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .black12)),
                                                  focusedBorder:
                                                      InputBorder.none,
                                                  hintText: 'Search City ...',
                                                ),
                                              ),
                                              suggestionsCallback:
                                                  CityApi1.getCitySuggestions,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'Please Enter City Name';
                                                }
                                              },
                                              itemBuilder:
                                                  (context, City? suggestion) {
                                                final city = suggestion!;

                                                return ListTile(
                                                  title: Text(city.name),
                                                );
                                              },
                                              noItemsFoundBuilder: (context) =>
                                                  const SizedBox(
                                                height: 10,
                                                child: Center(
                                                  child: Text(
                                                    'No City Found.',
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                  ),
                                                ),
                                              ),
                                              onSuggestionSelected:
                                                  (City? suggestion) {
                                                final city = suggestion!;

                                                typeAheadController2.text =
                                                    city.name.toString();
                                                dbclass.cityName =
                                                    city.name.toString();
                                                dbclass.setrecentCity(
                                                    city.name.toString());
                                                print('completed');
                                                // dbclass.SetCityForSearchbar(
                                                //   city.name.toString());

                                                Navigator.pop(context);
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ));
                              });
                        },
                        child: Consumer<Database>(
                          builder: (context, value, child) {
                            return Text(
                              value.cityName ?? 'Select City',
                              //dbclass.initial_city.toString(),
                              style: GoogleFonts.workSans(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Consumer<Database>(
            builder: (context, value, child) {
              return Positioned(
                top: 170,
                left: 150,
                child: AnimatedSmoothIndicator(
                    activeIndex: dbclass.activeIndex,
                    count: images.length,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: Color(0XFF02C908),
                    )),
              );
            },
          )
        ],
      ),
    );
  }
}

class MainSlider extends StatelessWidget {
  //const CategoriesScroller();

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
                dbclass.indicator(index);
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
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(i),
                          fit: BoxFit.cover,
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
