import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealed_bidd/staticData/Static.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class PlumberDetail extends StatelessWidget {
  const PlumberDetail({super.key});

  @override
  launchWhatsApp() async {
    final link = WhatsAppUnilink(
      phoneNumber: '+92' + MyClass.Contact,
      text: 'Hey!' +
          MyClass.Name +
          '.' +
          'I’m inquiring about the Services which you provide on Sealed Bidd',
    );
    await launch('$link');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(MyClass.categoryName.toString())),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 1,
            //color: Colors.red,
            child: CachedNetworkImage(
              imageUrl: MyClass.img,
              //MyClass.Category[index]['Image']
              // .toString(),
              fit: BoxFit.contain,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              color: Color(0xFFF0F0FA),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Name:',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF1C1F34),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.15),
                      Text(
                        MyClass.Name,
                        style: GoogleFonts.workSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF6C757D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Contact:',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF1C1F34),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                      Text(
                        MyClass.Contact,
                        style: GoogleFonts.workSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF6C757D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        'City:',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF1C1F34),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.2),
                      Text(
                        MyClass.City,
                        style: GoogleFonts.workSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF6C757D),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      Text(
                        'Location:',
                        style: GoogleFonts.workSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          color: const Color(0xFF1C1F34),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.07),
                      Expanded(
                        flex: 3,
                        child: Text(
                          MyClass.Location,
                          style: GoogleFonts.workSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFF6C757D),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            launch(
                              'tel:' + MyClass.Contact.toString(),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xFF02C908),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Icon(
                              Icons.phone,
                              color: Color(0xFF6C757D),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2),
                        GestureDetector(
                          onTap: () {
                            launchWhatsApp();
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.2,
                            decoration: BoxDecoration(
                              color: Color(0xFF02C908),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Icon(
                              Icons.whatsapp,
                              color: Color(0xFF6C757D),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
