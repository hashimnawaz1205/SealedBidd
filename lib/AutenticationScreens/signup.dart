import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../Models/CityApi.dart';
import '../Models/database.dart';
import 'login.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  late DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Users');
  final _formKey = GlobalKey<FormState>();
  FocusNode myFocusNode = new FocusNode();
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final areacontroller = TextEditingController();
  final aboutcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            InkWell(
              onTap: () async {
                dbclass.pickImage();
                // var pickedFile =
                //     await ImagePicker().pickImage(source: ImageSource.gallery);
                // print('File path:' + pickedFile.toString());
                // dbclass.setProfileImage(File(pickedFile!.path));
              },
              child: Consumer<Database>(builder: (context, value, child) {
                return value.Profilepicture != null
                    ? SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: CircleAvatar(
                          child: ClipOval(
                            child: Image.file(
                              value.Profilepicture!,
                              fit: BoxFit.cover,
                              width: 150,
                            ),
                          ),
                        ),
                      )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                "https://cdn2.vectorstock.com/i/1000x1000/17/61/male-avatar-profile-picture-vector-10211761.jpg",
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: Colors.black),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Add Iamge',
                                    style: GoogleFonts.workSans(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FontStyle.normal,
                                      color: Color(0xFF266325),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Icon(
                                    Icons.camera,
                                    color: Color(0xFF266325),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      );
              }),
            ),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Color(0xFF02C908),
            //     shape: BoxShape.circle,
            //   ),
            //   height: MediaQuery.of(context).size.height * 0.2,
            //   child: Icon(
            //     Icons.person,
            //     size: 100,
            //     color: Colors.white,
            //   ),
            // ),
            Container(
              width: double.infinity,
              child: Text(
                'Hello User!',
                style: GoogleFonts.workSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                  color: Color(0xFF266325),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  'Signup For Better Experience',
                  style: GoogleFonts.workSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xFF6C757D),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: namecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Name ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF02C908),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  labelText: 'Full Name',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: phonecontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Phone Number ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF02C908),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  labelText: 'Phone',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TypeAheadFormField<City?>(
                hideSuggestionsOnKeyboardHide: false,
                textFieldConfiguration: TextFieldConfiguration(
                  enableSuggestions: false,
                  autofocus: false,
                  controller: this.citycontroller,
                  decoration: InputDecoration(
                    hintStyle: GoogleFonts.ubuntu(color: Color(0xFF6C757D)),
                    focusedBorder: InputBorder.none,
                    hintText: 'City',
                    suffixIcon: Icon(
                      Icons.location_city,
                      color: Color(0xFF02C908),
                    ),
                  ),
                ),
                suggestionsCallback: CityApi1.getCitySuggestions,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter City Name';
                  }
                },
                itemBuilder: (context, City? suggestion) {
                  final city = suggestion!;

                  return ListTile(
                    title: Text(
                      city.name,
                      style: GoogleFonts.ubuntu(
                          color: Theme.of(context).primaryColor),
                    ),
                  );
                },
                noItemsFoundBuilder: (context) => const SizedBox(
                  height: 40,
                  child: Center(
                    child: Text(
                      'No City Found.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                onSuggestionSelected: (City? suggestion) {
                  final city = suggestion!;

                  this.citycontroller.text = city.name.toString();
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: areacontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Area ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.house_outlined,
                    color: Color(0xFF02C908),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  labelText: 'Area',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your Email ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF02C908),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                obscureText: dbclass.ishidenPassword,
                controller: passwordcontroller,
                validator: (value) {
                  if (value == null || value.length < 7) {
                    return 'Password character lenght should be atleast 7';
                  }
                },
                decoration: InputDecoration(
                  focusColor: Colors.green,
                  // prefixIcon: Icon(Icons.lock),
                  suffixIcon: InkWell(
                      child: Icon(
                        Icons.lock,
                        color: Color(0xFF02C908),
                      ),
                      onTap: (() {})
                      //dbclass.obscureviewPassword(),
                      ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  labelText: 'Password ',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              child: TextFormField(
                controller: aboutcontroller,
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Your About ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.description,
                    color: Color(0xFF02C908),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  labelText: 'About',
                  labelStyle: TextStyle(
                    color:
                        myFocusNode.hasFocus ? Colors.blue : Color(0xFF6C757D),
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02),

            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(16.0),
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF02C908),
                ),
                onPressed: () async {
                  //dbclass.signUp(emailcontroller.text, passwordcontroller.text);

                  if (_formKey.currentState!.validate()) {
                    try {
                      if (dbclass.image.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please upload an image'),
                          ),
                        );
                        return;
                      } else {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                                email: emailcontroller.text,
                                password: passwordcontroller.text);
                        Map<String, String> posts = {
                          'Name': namecontroller.text,
                          'Phone': phonecontroller.text,
                          'City': citycontroller.text,
                          'Area': areacontroller.text,
                          'Email': emailcontroller.text,
                          'Password': passwordcontroller.text,
                          'About': aboutcontroller.text,
                          'Image Url': dbclass.image,
                        };
                        dbRef.push().set(posts).whenComplete(() {
                          print('redirect me elswhere');
                        });
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        final scaffold = ScaffoldMessenger.of(context);
                        scaffold.showSnackBar(
                          SnackBar(
                            content: const Text(
                                'The password provided is too weak.'),
                            action: SnackBarAction(
                                label: 'OK',
                                onPressed: scaffold.hideCurrentSnackBar),
                          ),
                        );
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        final scaffold = ScaffoldMessenger.of(context);
                        scaffold.showSnackBar(
                          SnackBar(
                            content: const Text('Email-already-in-use.'),
                            action: SnackBarAction(
                                label: 'OK',
                                onPressed: scaffold.hideCurrentSnackBar),
                          ),
                        );
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text(
                  'SIGNUP',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have An Account?',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      color: Color(0xFF6C757D),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  InkWell(
                    onTap: () {
                      print('Clicked');

                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new Login()),
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.workSans(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w600,
                        fontSize: 14.0,
                        color: Color(0xFF02C908),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
