import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/plumber/plumberdetail.dart';
import 'package:sealed_bidd/staticData/Static.dart';

import '../Models/database.dart';

class Plumber extends StatelessWidget {
  const Plumber({super.key});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    //context.read();
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xFF02C908),
        title: Text(
          MyClass.userName.toString(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: dbclass.user.isEmpty
          ? Center(child: Text('No User Find'))
          : Consumer(
              builder: (context, value, child) {
                return ListView.builder(
                  itemCount: dbclass.user.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        MyClass.img = dbclass.user[index]['Image'].toString();
                        MyClass.Name = dbclass.user[index]['Name'].toString();
                        MyClass.categoryName =
                            dbclass.user[index]['Category'].toString();
                        MyClass.Contact =
                            dbclass.user[index]['Contact'].toString();
                        MyClass.City = dbclass.user[index]['City'].toString();
                        MyClass.Location =
                            dbclass.user[index]['Location'].toString();
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new PlumberDetail()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.width * 1,
                          decoration: BoxDecoration(
                            color: Color(0xFFF0F0FA),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black38,
                                      width: 0.5,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 4,
                                        // offset: Offset(
                                        //     0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: CachedNetworkImage(
                                      imageUrl: dbclass.user[index]['Image']
                                          .toString(),
                                      //MyClass.Category[index]['Image']
                                      // .toString(),
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
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      //'Hashim Nawaz ',
                                      dbclass.user[index]['Name'].toString(),

                                      style: GoogleFonts.workSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xFF1C1F34),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Text(
                                      //'Islamabad',
                                      dbclass.user[index]['City'].toString(),
                                      style: GoogleFonts.workSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xFF1C1F34),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        Text(
                                          // 'Bella Road,G10-Islamabad',
                                          dbclass.user[index]['Location']
                                              .toString(),
                                          style: GoogleFonts.workSans(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            color: Color(0xFF1C1F34),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
