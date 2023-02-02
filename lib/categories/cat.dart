import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sealed_bidd/Homepage/bottomnavigationbar.dart';
import 'package:sealed_bidd/booking.dart';
import 'package:sealed_bidd/reviewservice.dart';
import 'package:sealed_bidd/smarthome/SHome.dart';
import 'package:sealed_bidd/staticData/Static.dart';

import '../Models/database.dart';

class Category extends StatelessWidget {
  Category({super.key});
  // List<String> Data = [
  //   'Plumber',
  //   'Smart Home',
  //   'Painter',
  //   'Pest Control',
  //   'Carpenter',
  //   'Security',
  //   'AC Repair',
  //   'Salon',
  // ];

  // List images = [
  //   'assets/images/plumber.png',
  //   'assets/images/sh.png',
  //   'assets/images/painter.png',
  //   'assets/images/pc.png',
  //   'assets/images/cp.png',
  //   'assets/images/Security.png',
  //   'assets/images/ac.png',
  //   'assets/images/salon.png',
  // ];

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text(
          'Category',
          style: GoogleFonts.workSans(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: MyClass.Category.length,
          //reverse: false,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new SmartHome()),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white70,
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
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
                      child: CachedNetworkImage(
                        imageUrl: MyClass.Category[index]['Image'].toString(),
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
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
          ),
        ),
      ),
    );
  }
}
    // GridView.count(
          //   primary: false,
          //   padding: const EdgeInsets.all(8),
          //   crossAxisSpacing: 10,
          //   mainAxisSpacing: 10,
          //   crossAxisCount: 2,
          //   childAspectRatio: 0.9,
          //   children: [
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           new MaterialPageRoute(
          //               builder: (context) => new ReviewOnService()),
          //         );
          //       },
          //       child: Container(
          //         height: MediaQuery.of(context).size.height * 0.1,
          //         width: MediaQuery.of(context).size.width * 0.4,
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/plumber.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Plumber',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           new MaterialPageRoute(
          //               builder: (context) => new SmartHome()),
          //         );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/sh.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Smart Home',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //
          //
          //
          // GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/painter.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Painter',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/pc.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Pest Control',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/cp.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Carpenter',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/Security.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Security',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/ac.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'AC Repair',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigator.push(
          //         //   context,
          //         //   new MaterialPageRoute(
          //         //       builder: (context) => new SmartHome()),
          //         // );
          //       },
          //       child: Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(12),
          //           color: Colors.white70,
          //           border: Border.all(color: Colors.black12),
          //         ),
          //         child: Column(
          //           children: [
          //             Container(
          //               height: MediaQuery.of(context).size.height * 0.15,
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.only(
          //                     topLeft: Radius.circular(12),
          //                     topRight: Radius.circular(12)),
          //                 color: Color(0xFFF0F0FA),
          //               ),
          //               child: Center(
          //                 child: Image.asset(
          //                   'assets/images/salon.png',
          //                   fit: BoxFit.cover,
          //                   scale: 2,
          //                 ),
          //               ),
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: Text(
          //                 'Salon',
          //                 style: GoogleFonts.workSans(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w500,
          //                   fontStyle: FontStyle.normal,
          //                   color: Color(0xFF1C1F34),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
       
       