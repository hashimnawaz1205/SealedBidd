import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class FavouriteServices extends StatelessWidget {
  const FavouriteServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text(
          'Favourite Services',
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          separatorBuilder: (context, index) =>
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          itemCount: 6,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                //   Navigator.push(
                //     context,
                //     new MaterialPageRoute(builder: (context) => new SmartHome()),
                //   );
                //
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white70,
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: Color(0xFFF0F0FA),
                      ),
                      child: Center(
                        child: Image.asset('assets/images/splash.png'),
                        //  CachedNetworkImage(
                        //   imageUrl: MyClass.Category[index]['Image'].toString(),
                        //   fit: BoxFit.cover,
                        //   placeholder: (context, url) =>
                        //       const Center(child: CircularProgressIndicator()),
                        //   errorWidget: (context, url, error) =>
                        //       const Icon(Icons.error),
                        // ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 8.0,
                      ),
                      child: Text(
                        'Plumber',
                        style: GoogleFonts.workSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFF266325),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '1500',
                            style: GoogleFonts.workSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: Color(0xFF266325),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.035,
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 0.5,
                                  blurRadius: 3,
                                  // offset: Offset(
                                  //     0, 3), // changes position of shadow
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
