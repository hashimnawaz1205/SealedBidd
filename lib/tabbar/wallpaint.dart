import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class WallPainting extends StatefulWidget {
  const WallPainting({super.key});

  @override
  State<WallPainting> createState() => _WallPaintingState();
}

class _WallPaintingState extends State<WallPainting> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            // color: Colors.red,
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              SizedBox(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPUf71XUwWu2DvnZKA5N_WkSqu8JYAElWL0Q&usqp=CAU'),
                              fit: BoxFit.cover)),
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
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xFF02C908)),
                            child: Center(
                              child: Text(
                                '\$150',
                                style: TextStyle(color: Colors.white),
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
                          Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
                          Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
                          Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
                          Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
                          Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              '4.3',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF6C757D),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Painting For Beautiful Home....',
                          style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
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
                            Container(
                              width: MediaQuery.of(context).size.width * 0.17,
                              height: MediaQuery.of(context).size.height * 0.08,
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/images/Baby.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Wade Warm',
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
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}



   // SizedBox(
              //   child: Stack(
              //     clipBehavior: Clip.none,
              //     children: [
              //       Container(
              //         height: 200,
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.only(
              //               topLeft: Radius.circular(20),
              //               topRight: Radius.circular(20),
              //             ),
              //             image: DecorationImage(
              //                 image: CachedNetworkImageProvider(
              //                     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPUf71XUwWu2DvnZKA5N_WkSqu8JYAElWL0Q&usqp=CAU'),
              //                 fit: BoxFit.cover)),
              //       ),
              //       Positioned(
              //         bottom: -14,
              //         right: 19,
              //         child: Container(
              //           height: 40,
              //           width: 80,
              //           decoration: BoxDecoration(
              //             color: Colors.white,
              //             borderRadius: BorderRadius.circular(50),
              //           ),
              //           child: Padding(
              //             padding: const EdgeInsets.all(5.0),
              //             child: Container(
              //               height: 40,
              //               width: 80,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(50),
              //                   color: Color(0xFF02C908)),
              //               child: Center(
              //                 child: Text(
              //                   '\$150',
              //                   style: TextStyle(color: Colors.white),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           children: [
              //             Icon(
              //               Icons.star,
              //               color: Colors.yellow.shade700,
              //             ),
              //             Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
              //             Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
              //             Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
              //             Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
              //             Icon(Icons.star, color: Color(0xFFFFBD00), size: 20),
              //             Padding(
              //               padding: const EdgeInsets.only(left: 8.0),
              //               child: Text(
              //                 '4.3',
              //                 style: GoogleFonts.workSans(
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w600,
              //                   fontStyle: FontStyle.normal,
              //                   color: Color(0xFF6C757D),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //         Container(
              //           width: 150,
              //           child: Text(
              //             'Painting For Beautiful Home....',
              //             style: GoogleFonts.workSans(
              //               fontSize: 16,
              //               fontWeight: FontWeight.w500,
              //               fontStyle: FontStyle.normal,
              //               color: Color(0xFF1C1F34),
              //             ),
              //             overflow: TextOverflow.ellipsis,
              //             maxLines: 2,
              //           ),
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.only(top: 18.0),
              //           child: Row(
              //             children: [
              //               Container(
              //                 width: MediaQuery.of(context).size.width * 0.17,
              //                 height: MediaQuery.of(context).size.height * 0.08,
              //                 child: ClipOval(
              //                   child: Image.asset(
              //                     'assets/images/Baby.jpeg',
              //                     fit: BoxFit.cover,
              //                   ),
              //                 ),
              //               ),
              //               Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Text(
              //                   'Wade Warm',
              //                   style: GoogleFonts.workSans(
              //                     fontSize: 14,
              //                     fontWeight: FontWeight.w500,
              //                     fontStyle: FontStyle.normal,
              //                     color: Color(0xFF6C757D),
              //                   ),
              //                 ),
              //               )
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // )
           
