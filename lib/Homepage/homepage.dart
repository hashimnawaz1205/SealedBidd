// ignore_for_file: unnecessary_new

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/Homepage/Homesliderandlocation.dart';
import 'package:sealed_bidd/Homepage/mainpageslider.dart';
import 'package:sealed_bidd/loadingwidget.dart';
import 'package:sealed_bidd/plumber/plumber.dart';

import 'package:sealed_bidd/profile/profiles.dart';
import 'package:sealed_bidd/providerDetail.dart';
import 'package:sealed_bidd/staticData/Static.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../IntroScreens/boardingscreen.dart';
import '../Models/database.dart';
import '../categories/cat.dart';

class Homepage extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();

    dbclass.getCategory();
    dbclass.getData();
    bool closeMainSliderContainer = false;
    final MainSlider mainSliderScroller = MainSlider();
    ScrollController controller = ScrollController();

    return Scaffold(
      drawer: const Profile(),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeslider(scaffoldKey: scaffoldKey),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Category',
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Category()),
                      );
                    },
                    child: Text(
                      'view All',
                      style: GoogleFonts.workSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Consumer<Database>(builder: (context, value, child) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.2,
                child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                  scrollDirection: Axis.horizontal,
                  itemCount: MyClass.Category.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        String user =
                            MyClass.Category[index]['Name'].toString();
                        MyClass.userName =
                            MyClass.Category[index]['Name'].toString();
                        print('User :' + user.toString());

                        await dbclass.getSpecificCategory(context, user);
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white70,
                          border: Border.all(color: Colors.black12),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                color: Color(0xFFF0F0FA),
                              ),
                              child: Center(
                                child: CachedNetworkImage(
                                  imageUrl: MyClass.Category[index]['Image']
                                      .toString(),
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                MyClass.Category[index]['Name'],
                                style: GoogleFonts.workSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FontStyle.normal,
                                  color: Color(0xFF1C1F34),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services',
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF266325),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   new MaterialPageRoute(
                      //       builder: (context) => new ProviderDetail()),
                      // );
                    },
                    child: Text(
                      'view All',
                      style: GoogleFonts.workSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF6C757D),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    SizedBox(width: MediaQuery.of(context).size.width * 0.001),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new ProviderDetail()),
                      );
                    },
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(29)),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.27,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        image: const DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPUf71XUwWu2DvnZKA5N_WkSqu8JYAElWL0Q&usqp=CAU'),
                                            fit: BoxFit.cover)),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 20,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.white),
                                      child: Center(
                                        child: Text(
                                          'Developer',
                                          style: GoogleFonts.workSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 10.0,
                                            color: Color(0xFF02C908),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -14,
                                    right: 19,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.05,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.2,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color(0xFF02C908)),
                                          child: const Center(
                                            child: Text(
                                              '\$150',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Colors.yellow.shade700,
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '4.3',
                                            style: GoogleFonts.workSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14.0,
                                              color: Color(0xFF6C757D),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: Text(
                                        'Painting For Beautiful Home....',
                                        style: GoogleFonts.workSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.0,
                                          color: Color(0xFF1C1F34),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.15,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.3,
                                                  child: ClipOval(
                                                    child: Image.asset(
                                                      "assets/images/Baby.jpeg",
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ))),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Wade Warm',
                                              style: GoogleFonts.workSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14.0,
                                                color: Color(0xFF6C757D),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            homeslider2(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured',
                    style: GoogleFonts.workSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF266325),
                    ),
                  ),
                  Text(
                    'view All',
                    style: GoogleFonts.workSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF6C757D),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Consumer<Database>(builder: (context, value, child) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => SizedBox(
                        width: MediaQuery.of(context).size.width * 0.001),
                    itemCount: MyClass.allData.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.55,
                        decoration: BoxDecoration(
                            color: Color(0XFFF6F7F9),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      // image: DecorationImage(
                                      //     image: CachedNetworkImageProvider(
                                      //       // MyClass.allData[index]['image']
                                      //       //       .toString()
                                      //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPUf71XUwWu2DvnZKA5N_WkSqu8JYAElWL0Q&usqp=CAU',
                                      //     ),
                                      //     fit: BoxFit.cover),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: CachedNetworkImage(
                                        imageUrl: MyClass.allData[index]
                                            ['image'],
                                        fit: BoxFit.contain,
                                        placeholder: (context, url) =>
                                            const Center(
                                                child:
                                                    CircularProgressIndicator()),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 5,
                                    top: 5,
                                    child: InkWell(
                                      onTap: (() {}),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.04,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.22,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: Center(
                                          child: Text(
                                            MyClass.allData[index]['name']
                                                .toString(),
                                            style: GoogleFonts.workSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 10.0,
                                              color: Color(0xFF02C908),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -14,
                                    right: 19,
                                    child: Container(
                                      height: 40,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Color(0XFF02C908)),
                                          child: Center(
                                            child: Text(
                                              '\$' +
                                                  MyClass.allData[index]
                                                          ['price']
                                                      .toString(),
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Color(0XFFFFBD00),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0XFFFFBD00),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0XFFFFBD00),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0XFFFFBD00),
                                          size: 20,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Color(0XFFFFBD00),
                                          size: 20,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            '4.3',
                                            style: GoogleFonts.workSans(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12.0,
                                              color: Color(0xFF6C757D),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 150,
                                      child: Text(
                                        'Painting For Beautiful Home....',
                                        style: GoogleFonts.workSans(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                          color: Color(0xFF1C1F34),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 18.0),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.transparent,
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  "assets/images/Baby.jpeg",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Wade Warm',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black87),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
