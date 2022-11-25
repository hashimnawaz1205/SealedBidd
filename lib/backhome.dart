import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RateNow extends StatelessWidget {
  const RateNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Image.asset('assets/images/backhome.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 21.0, right: 21.0),
            child: Text(
              'No Matching Views',
              style: GoogleFonts.workSans(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Color(0xFF266325),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: Text(
              'We Couldn\'t Find Anything  Related To Your Search',
              style: GoogleFonts.workSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Color(0xFF6C757D),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Color(0xFF02C908),
              ),
              child: Center(
                child: Text(
                  'Back To Home',
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
