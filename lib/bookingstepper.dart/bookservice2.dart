import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sealed_bidd/bookingstepper.dart/bookservice1.dart';

import '../Models/database.dart';

class BookServiceStep2 extends StatelessWidget {
  const BookServiceStep2({super.key});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text(
          'Book Service',
          style: GoogleFonts.workSans(
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, top: 30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Color(0xFF02C908),
                      border: Border.all(
                        color: Color(0xFF02C908),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: Color(0xFF02C908),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                  child: Center(
                    child: Text(
                      '- - - - - - - - - ',
                      style: GoogleFonts.workSans(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                        color: Color(0xFFEBEBEB),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: BoxDecoration(
                      color: Color(0xFF02C908),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '02',
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70.0, top: 20.0),
                  child: Text(
                    'Step1',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color(0xFF6C757D),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 140.0, top: 20.0),
                  child: Text(
                    'Step2',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color(0xFF266325),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 25.0, top: 25.0, bottom: 10.0, right: 25.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  // color: Color(0xFF02C908),
                  color: Color(0xFFF6F7F9),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                          child: Text(
                            'Appartment Cleaning',
                            style: GoogleFonts.workSans(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF266325),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.22,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Row(
                              children: [
                                Consumer<Database>(
                                    builder: (context, value, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      dbclass.subtract();
                                    },
                                    child: Icon(
                                      Icons.arrow_left,
                                      color: dbclass.arrowleft
                                          ? const Color(0xFF02C908)
                                          : const Color(0xFF6C757D),
                                      size: 30,
                                    ),
                                  );
                                }),
                                Consumer<Database>(
                                    builder: (context, value, child) {
                                  return Text(
                                    dbclass.counter.toString(),
                                    style: GoogleFonts.workSans(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Colors.black,
                                    ),
                                  );
                                }),
                                Consumer<Database>(
                                    builder: (context, value, child) {
                                  return GestureDetector(
                                    onTap: () {
                                      dbclass.add();
                                    },
                                    child: Icon(
                                      Icons.arrow_right,
                                      color: dbclass.arrowright
                                          ? const Color(0xFF02C908)
                                          : const Color(0xFF6C757D),
                                      size: 30,
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.13,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/building.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 25.0, bottom: 10.0),
              child: Text(
                'Price Detail',
                style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: const Color(0xFF266325),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 21.0, top: 2.0, right: 21.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 13,
                height: MediaQuery.of(context).size.height * 0.36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFFF6F7F9),
                  //color: Colors.red,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Price',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF266325),
                              ),
                            ),
                          ),
                          Text(
                            '\$120',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF6C757D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Sub Total',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF266325),
                              ),
                            ),
                          ),
                          Text(
                            '\$120 * 2 = \$240',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF6C757D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Discount',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF266325),
                              ),
                            ),
                          ),
                          Text(
                            '(5% off)',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF3BA859),
                            ),
                          ),
                          Text(
                            '- \$15.12',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF3BA859),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Tax',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF266325),
                              ),
                            ),
                          ),
                          Text(
                            '\$15.12',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFFFB2F2F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Coupan',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF266325),
                              ),
                            ),
                          ),
                          Text(
                            '(AB4575AV)',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF02C908),
                            ),
                          ),
                          Text(
                            '- \$10',
                            style: GoogleFonts.workSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF3BA859),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 21.0, right: 21.0, top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 21.0),
                            child: Text(
                              'Total Amount',
                              style: GoogleFonts.workSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.normal,
                                color: const Color(0xFF1C1F34),
                              ),
                            ),
                          ),
                          Text(
                            '\$255.12',
                            style: GoogleFonts.workSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontStyle: FontStyle.normal,
                              color: const Color(0xFF266325),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0),
              child: Row(
                children: [
                  Consumer<Database>(builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 4.0),
                      child: GestureDetector(
                        onTap: () {
                          dbclass.Previous();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: dbclass.previousButton
                                  ? Color(0xFF02C908)
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              'Previous',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: dbclass.previousButton
                                    ? Colors.white
                                    : Color(0xFF266325),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  Consumer<Database>(builder: (context, value, child) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 12.0),
                      child: GestureDetector(
                        onTap: () {
                          dbclass.Book();
                          Alert(
                              context: context,
                              //title: 'Account Created',
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.2,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.asset(
                                        'assets/images/tick.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(
                                      'Confirm Booking',
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22.0,
                                        color: Color(0xFF266325),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                    Text(
                                      'Are you sure you want to confirm the booking',
                                      style: GoogleFonts.workSans(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0,
                                        color: Color(0xFF6C757D),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              buttons: [
                                DialogButton(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0XFF266325)),
                                  child: Text(
                                    'Cancel',
                                    style: GoogleFonts.workSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Color(0XFF266325),
                                    ),
                                  ),
                                  onPressed: () {
                                    print('button click');
                                    Navigator.pop(context);
                                  },
                                ),
                                DialogButton(
                                  color: Color(0xFF02C908),
                                  child: Text(
                                    'Book',
                                    style: GoogleFonts.workSans(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    print('button click');
                                    Alert(
                                        context: context,
                                        //title: 'Account Created',
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.2,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.1,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/tick.png',
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Text(
                                                'Booking Successfull',
                                                style: GoogleFonts.workSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22.0,
                                                  color: Color(0xFF266325),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              Text(
                                                'It is a long established fact that a reader will be distracted by the readable',
                                                style: GoogleFonts.workSans(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14.0,
                                                  color: Color(0xFF6C757D),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        buttons: [
                                          DialogButton(
                                            color: Color(0xFF02C908),
                                            child: Text(
                                              'Back To Home',
                                              style: GoogleFonts.workSans(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            },
                                          )
                                        ]).show();
                                  },
                                )
                              ]).show();
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              color: dbclass.bookButton
                                  ? Color(0xFF02C908)
                                  : Colors.white),
                          child: Center(
                            child: Text(
                              ' Book',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: dbclass.bookButton
                                    ? Colors.white
                                    : Color(0xFF266325),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
