import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sealed_bidd/filterby.dart';
import 'package:sealed_bidd/tabbar/wallpaint.dart';

class SmartHome extends StatefulWidget {
  const SmartHome({super.key});

  @override
  State<SmartHome> createState() => _SmartHomeState();
}

class _SmartHomeState extends State<SmartHome> {
  FocusNode myFocusNode = new FocusNode();
  final Searchcontroller = TextEditingController();
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Smart Home',
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
              color: Colors.white,
            ),
          ),
          // centerTitle: true,
          backgroundColor: Color(0xFF02C908),
          elevation: 0,
          // give the app bar rounded corners
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //     bottomLeft: Radius.circular(20.0),
          //     bottomRight: Radius.circular(20.0),
          //   ),
          // ),
        ),
        body: Column(
          children: [
            Row(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black12,
                    ),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: TextFormField(
                      controller: Searchcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xFF02C908),
                        ),
                        border: OutlineInputBorder(
                          //borderSide: BorderSide(color: Colors.green),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        labelText: 'Search here...',
                        labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.blue
                              : Color(0xFF6C757D),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new FilterBy()),
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                        color: Color(0xFF02C908),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.filter,
                        color: Colors.white60,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AppBar(
                  bottom: TabBar(
                    labelPadding: EdgeInsets.all(2),
                    indicatorWeight: 3.0,
                    indicatorColor: Color(0xFF02C908),
                    unselectedLabelColor: Colors.black,
                    labelColor: Color(0xFF02C908),
                    tabs: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: Tab(
                          text: 'All',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: Tab(
                          text: 'Wall Painting',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white70,
                        ),
                        child: Tab(
                          text: 'Home Painting',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // create widgets for each tab bar here
            Expanded(
              child: TabBarView(
                children: [
                  // first tab bar view widget
                  WallPainting(),

                  // second tab bar viiew widget

                  WallPainting(),
                  // Third tab bar viiew widget
                  WallPainting(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
