import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/staticData/Static.dart';

import 'Homepage/NetworkTypeAheadPage.dart';
import 'Models/database.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    context.read<Database>().getRecentSearch();

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NetworkTypeAheadPage(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Search',
                    style: GoogleFonts.workSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                      color: Color(0xFF1C1F34),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      dbclass.removeRecentSearch();
                    },
                    child: Text(
                      'Clear Search',
                      style: GoogleFonts.workSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFF1C1F34),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Consumer<Database>(
                builder: (context, value, child) {
                  return (value.recent.isNotEmpty)
                      ? ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: value.recent.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                MyClass.userName =
                                    value.recent[index].toString();
                                dbclass.getSpecificCategory(
                                  context,
                                  value.recent[index].toString(),
                                );
                              },
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      value.recent[index].toString(),
                                      style: GoogleFonts.workSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        color: Color(0xFF1C1F34),
                                      ),
                                    ),
                                    trailing: Icon(Icons.chevron_right),
                                  ),
                                  Divider(),
                                ],
                              ),
                            );
                          },
                        )
                      : const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('No search..... '),
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Popular Search',
                style: GoogleFonts.workSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF1C1F34),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListView.builder(
                  itemCount: 5,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              'Plumber ',
                              style: GoogleFonts.workSans(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF1C1F34),
                              ),
                            ),
                            trailing: Icon(Icons.chevron_right),
                          ),
                          Divider(),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
