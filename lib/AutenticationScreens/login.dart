// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/AutenticationScreens/sign.dart';
import 'package:sealed_bidd/AutenticationScreens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Homepage/bottomnavigationbar.dart';
import '../Models/database.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({super.key});

  //late DatabaseReference dbRef = FirebaseDatabase.instance.ref().child('Users');

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          SizedBox(
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
            child: Text(
              'Welcome Back ,You Have Been Missed For Long Time',
              style: GoogleFonts.workSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
                color: const Color(0xFF6C757D),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: myFocusNode.hasFocus
                      ? Colors.blue
                      : const Color(0xFF6C757D),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Consumer<Database>(
            builder: ((context, value, child) {
              return Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: TextFormField(
                  obscureText: value.ishidenPassword,
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      suffix: InkWell(
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Colors.green,
                        ),
                        onTap: dbclass.obscureviewPassword,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 2.0),
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      labelText: 'Password ',
                      labelStyle: TextStyle(
                          color: myFocusNode.hasFocus
                              ? Colors.blue
                              : Color(0xFF6C757D))),
                ),
              );
            }),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer<Database>(
                  builder: ((context, value, child) {
                    return Checkbox(
                      focusColor: Colors.green,
                      activeColor: Colors.green,
                      value: dbclass.val,
                      onChanged: (bool? value) {
                        dbclass.isChecked();
                      },
                    );
                  }),
                ),
                Text(
                  'Remember Me',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                    color: const Color(0xFF6C757D),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.16,
                ),
                InkWell(
                  onTap: () {
                    print('Clicked');

                    // Navigator.push(
                    //   context,
                    //   new MaterialPageRoute(builder: (context) => new Signup()),
                    // );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                      color: const Color(0xFF02C908),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
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
                if (emailcontroller.text == '') {
                  final scaffold = ScaffoldMessenger.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: const Text('Enter Email.'),
                      action: SnackBarAction(
                          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                } else if (passwordcontroller.text == '') {
                  final scaffold = ScaffoldMessenger.of(context);
                  scaffold.showSnackBar(
                    SnackBar(
                      content: const Text('Enter Password.'),
                      action: SnackBarAction(
                          label: 'OK', onPressed: scaffold.hideCurrentSnackBar),
                    ),
                  );
                } else {
                  try {
                    UserCredential userCredential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailcontroller.text,
                            password: passwordcontroller.text);
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => const bottomnavigationbar()),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('No user found for that email.'),
                          action: SnackBarAction(
                              label: 'OK',
                              onPressed: scaffold.hideCurrentSnackBar),
                        ),
                      );
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text(
                              'Wrong password provided for that user.'),
                          action: SnackBarAction(
                              label: 'OK',
                              onPressed: scaffold.hideCurrentSnackBar),
                        ),
                      );
                      print('Wrong password provided for that user.');
                    }
                  }
                }
              },
              child: Text(
                'LOGIN',
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                  color: const Color(0xFFFFFFFF),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t Have An Account?',
                style: GoogleFonts.workSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  color: const Color(0xFF6C757D),
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
                    new MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: GoogleFonts.workSans(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: const Color(0xFF02C908),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Text(
            'Or Continue With ',
            style: GoogleFonts.workSans(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: const Color(0xFF6C757D),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/google.png')),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.1,
                child: GestureDetector(
                    onTap: () {},
                    child: Image.asset('assets/images/phone.png')),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
