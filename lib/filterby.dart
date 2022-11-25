import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:provider/provider.dart';

import 'Models/database.dart';

class FilterBy extends StatelessWidget {
  const FilterBy({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> one = [
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
    ];
    var dbclass = context.read<Database>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text('FilterBy'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Color(0xFFF6F7F9).withOpacity(1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Category Name List',
                      style: GoogleFonts.workSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: const Color(0xFF1C1F34),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      color: Color(0xFFF6F7F9),
                    ),
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            //mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  'Painting',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF266325),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  height: MediaQuery.of(context).size.height *
                                      0.015,
                                  decoration: BoxDecoration(
                                      //color: Colors.red,
                                      ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(''),
                                      Consumer<Database>(
                                        builder: ((context, value, child) {
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(''),
                                              RadioButton(
                                                description: '',
                                                value: index,
                                                groupValue: value.selectedRd,
                                                activeColor:
                                                    const Color(0xFF02C908),
                                                onChanged: ((val) {
                                                  dbclass.setselectedRd(val!);
                                                }),
                                              ),
                                            ],
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Text(
                                  '33 Services',
                                  style: GoogleFonts.workSans(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ),
                              Divider(),
                            ],
                          );
                        })),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    color: Color(0xFFF6F7F9),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Rating',
                          style: GoogleFonts.workSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            color: const Color(0xFF1C1F34),
                          ),
                        ),
                      ),
                      Consumer<Database>(
                        builder: ((context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(
                                  description: '',
                                  value: 0,
                                  groupValue: value.selectedRadio,
                                  activeColor: const Color(0xFF02C908),
                                  onChanged: ((val) {
                                    dbclass.setselectedRadio(val!);
                                  }),
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '5.0',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Consumer<Database>(
                        builder: ((context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(
                                  description: '',
                                  value: 1,
                                  groupValue: value.selectedRadio,
                                  activeColor: const Color(0xFF02C908),
                                  onChanged: ((val) {
                                    dbclass.setselectedRadio(val!);
                                  }),
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '4.0',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Consumer<Database>(
                        builder: ((context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(
                                  description: '',
                                  value: 2,
                                  groupValue: value.selectedRadio,
                                  activeColor: const Color(0xFF02C908),
                                  onChanged: ((val) {
                                    dbclass.setselectedRadio(val!);
                                  }),
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '3.0',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Consumer<Database>(
                        builder: ((context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(
                                  description: '',
                                  value: 3,
                                  groupValue: value.selectedRadio,
                                  activeColor: const Color(0xFF02C908),
                                  onChanged: ((val) {
                                    dbclass.setselectedRadio(val!);
                                  }),
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '2.0',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                      Consumer<Database>(
                        builder: ((context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RadioButton(
                                  description: '',
                                  value: 4,
                                  groupValue: value.selectedRadio,
                                  activeColor: const Color(0xFF02C908),
                                  onChanged: ((val) {
                                    dbclass.setselectedRadio(val!);
                                  }),
                                ),
                                const Icon(
                                  Icons.star_rate,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                const Icon(
                                  Icons.star_border,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  '1.0',
                                  style: GoogleFonts.workSans(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.normal,
                                    color: const Color(0xFF6C757D),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}
