import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});
  final currentpasscontroller = TextEditingController();
  final newpasscontroller = TextEditingController();
  final newpassagaincontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF02C908),
        title: Text(
          'Change Password',
          style: GoogleFonts.workSans(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Your password must be at least 6 characters and include a combination of numbers,letters and special characters (!\$@%).',
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF266325),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Text(
              //     'Current password ',
              //     style: GoogleFonts.workSans(
              //       fontSize: 16,
              //       fontWeight: FontWeight.w500,
              //       fontStyle: FontStyle.normal,
              //       color: Color(0xFF266325),
              //     ),
              //   ),
              // ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: currentpasscontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter Current Password ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'Current password',
                      labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : const Color(0xFF6C757D),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: newpasscontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter New Password ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'New password',
                      labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : const Color(0xFF6C757D),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: TextFormField(
                    controller: newpassagaincontroller,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please Enter New Password,Again ';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      labelText: 'New password,again',
                      labelStyle: TextStyle(
                        color: myFocusNode.hasFocus
                            ? Colors.blue
                            : const Color(0xFF6C757D),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.08,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF02C908),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print('All Done');
                        }
                      },
                      child: Text(
                        'Save Changes',
                        style: GoogleFonts.workSans(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
