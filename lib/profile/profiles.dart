import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/profile/changepassword.dart';
import 'package:sealed_bidd/profile/favouriteservices.dart';
import 'package:sealed_bidd/profile/termandcondition.dart';

import '../IntroScreens/boardingscreen.dart';
import '../Models/database.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text(
          'Profile',
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      //color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage('assets/images/building.png'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    right: 4,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF02C908),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) =>
                          //           const EditProfilePage()),
                          //);
                        },
                        child: Icon(
                          Icons.edit_outlined,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Saul Armstrong',
              style: GoogleFonts.workSans(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Color(0xFF266325),
              ),
            ),
            Text(
              'saularmstrong@sealedbidd.com',
              style: GoogleFonts.workSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: Color(0xFF6C757D),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  color: Color(0xFFF6F7F9),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 18.0),
                  child: Text(
                    'GENERAL',
                    style: GoogleFonts.workSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF02C908),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new ChangePassword()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.lock,
                  color: Color(0XFF6C757D),
                ),
                title: Text(
                  'Change Password',
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF266325),
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.map,
                color: Color(0XFF6C757D),
              ),
              title: Text(
                'App Language',
                style: GoogleFonts.workSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF266325),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new FavouriteServices()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.favorite_outline,
                  color: Color(0XFF6C757D),
                ),
                title: Text(
                  'Favourite Services',
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF266325),
                  ),
                ),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.star_border_outlined,
                color: Color(0XFF6C757D),
              ),
              title: Text(
                'Rate Us',
                style: GoogleFonts.workSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF266325),
                ),
              ),
              trailing: Icon(Icons.chevron_right),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                  //color: Colors.red,
                  color: Color(0xFFF6F7F9),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0, top: 18.0),
                  child: Text(
                    'ABOUT APP',
                    style: GoogleFonts.workSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF02C908),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.security_outlined,
                color: Color(0XFF6C757D),
              ),
              title: Text(
                'Privacy Policy',
                style: GoogleFonts.workSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF266325),
                ),
              ),
              //trailing: Icon(Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new TermAndCondition()),
                );
              },
              child: ListTile(
                leading: Icon(
                  Icons.message_outlined,
                  color: Color(0XFF6C757D),
                ),
                title: Text(
                  'Terms And Conditions',
                  style: GoogleFonts.workSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF266325),
                  ),
                ),
                //trailing: Icon(Icons.chevron_right),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Color(0XFF6C757D),
              ),
              title: Text(
                'Help Support',
                style: GoogleFonts.workSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF266325),
                ),
              ),
              //trailing: Icon(Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () async {
                await dbclass.logout();
                await dbclass.removeRecentCity();
                dbclass.removeRecentSearch();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BoardingScreen(),
                  ),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Color(0xFF02C908),
                ),
                child: Center(
                  child: Text(
                    'Logout',
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
      ),
    );
  }
}
