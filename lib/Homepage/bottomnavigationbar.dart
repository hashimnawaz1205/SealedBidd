// import 'package:flutter/material.dart';
//  import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:sealed_bidd/Homepage/homepage.dart';
// import 'package:sealed_bidd/chat/chats.dart';
// import 'package:sealed_bidd/pending/pendings.dart';
// import 'package:sealed_bidd/profile/profiles.dart';

// class bottomnavigationbar extends StatelessWidget {
//   const bottomnavigationbar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(items: [
//       BottomNavigationBarItem(
//           icon: Icon(Icons.home, color: Colors.black), label: ""),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.book, color: Colors.black), label: ''),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.category, color: Colors.black), label: ''),
//       BottomNavigationBarItem(
//           icon: Icon(Icons.forward_to_inbox_outlined, color: Colors.black),
//           label: ''),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.person, color: Colors.black),
//         label: "",
//       )
//     ]);
//   }
// }

import 'package:flutter/material.dart';
import 'package:sealed_bidd/Homepage/homepage.dart';
import 'package:sealed_bidd/booking.dart';
import 'package:sealed_bidd/bookingstepper.dart/bookservice1.dart';
import 'package:sealed_bidd/categories/cat.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sealed_bidd/detailpage.dart';
import 'package:sealed_bidd/pending/pendings.dart';
import 'package:sealed_bidd/profile/profiles.dart';
import 'package:sealed_bidd/providerDetail.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  int selectedIndex = 0;
  final tabs = [
    //ProviderDetail(),
    Homepage(),
    Pending(),
    Category(),
    Booking(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
          child: GNav(
              backgroundColor: Colors.white,
              activeColor: Colors.black,
              gap: 5,
              tabs: [
                GButton(
                  padding: EdgeInsets.all(8),
                  icon: Icons.home,
                  backgroundColor: Colors.green.shade100,
                  iconActiveColor: Color(0xFF02C908),
                  textColor: Color(0xFF02C908),
                  iconColor: Color(0xFF02C908),
                  text: 'Home          ',
                  onPressed: () {
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
                GButton(
                  padding: EdgeInsets.all(8),
                  icon: Icons.pending_outlined,
                  iconColor: Color(0xFF02C908),
                  backgroundColor: Colors.green.shade100,
                  iconActiveColor: Color(0xFF02C908),
                  textColor: Color(0xFF02C908),
                  text: 'Pending       ',
                  onPressed: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
                GButton(
                  padding: EdgeInsets.all(8),
                  icon: Icons.category_outlined,
                  iconColor: Color(0xFF02C908),
                  backgroundColor: Colors.green.shade100,
                  iconActiveColor: Color(0xFF02C908),
                  textColor: Color(0xFF02C908),
                  text: 'Categories         ',
                  onPressed: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                ),
                GButton(
                  padding: EdgeInsets.all(8),
                  icon: Icons.chat_outlined,
                  iconColor: Color(0xFF02C908),
                  backgroundColor: Colors.green.shade100,
                  iconActiveColor: Color(0xFF02C908),
                  textColor: Color(0xFF02C908),
                  text: 'Chat         ',
                  onPressed: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                ),
                GButton(
                  padding: EdgeInsets.all(8),
                  icon: Icons.person_outlined,
                  backgroundColor: Colors.green.shade100,
                  iconActiveColor: Color(0xFF02C908),
                  iconColor: Color(0xFF02C908),
                  textColor: Color(0xFF02C908),
                  text: 'Profile       ',
                  onPressed: () {
                    setState(() {
                      selectedIndex = 4;
                    });
                  },
                ),
              ]),
        ),
      ),
      body: tabs[selectedIndex],
    );
  }
}
