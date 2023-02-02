import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:sealed_bidd/Homepage/bottomnavigationbar.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../Models/database.dart';

class OTPScreen extends StatefulWidget {
  final String phone;

  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  String codeValue = '';
  @override
  void codeUpdated() {
    // TODO: implement codeUpdated
    setState(() {
      print('code Updated');
    });
  }

  @override
  void dispose() {
    // SmsAutoFill().unregisterListener();
    // print('unregister Listener');
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // dispose();
    _verifyPhone();
    //listenOtp();
  }

  void listenOtp() async {
    SmsAutoFill().unregisterListener();

    await SmsAutoFill().listenForCode();
    print('Opt Listen Code');
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        // color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    var dbclass = context.read<Database>();
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +92-${widget.phone}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child:

                // PinFieldAutoFill(
                //   currentCode: codeValue,
                //   codeLength: 6,
                //   onCodeChanged: (code) {
                //     print('on Code Change ' + code.toString());
                //     setState(() {
                //       codeValue = code.toString();
                //     });
                //   },
                //   onCodeSubmitted: (val) {
                //     print('on Code Submitted ' + val.toString());
                //   },
                // ),

                Pinput(
              enabled: true,
              autofocus: true,
              length: 6,
              // androidSmsAutofillMethod: ,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              pinAnimationType: PinAnimationType.fade,
              // onCompleted: (value) {
              //   ScaffoldMessenger.of(context)
              //       .showSnackBar(SnackBar(content: Text('All Completed')));
              // },
              onSubmitted: (pin) async {
                try {
                  // codeValue = pin.toString();
                  print(pin.length);
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode!, smsCode: pin))
                      .then((value) async {
                    dbclass.getSpecificPhone(context, widget.phone);
                    // Navigator.pushAndRemoveUntil(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const bottomnavigationbar()),
                    //     (route) => false);
                  });
                } catch (e) {
                  print('this is your error message ' + e.toString());
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              },
            ),
          ),
          GestureDetector(
            onTap: () async {
              try {
                //print(pin.length);
                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode!,
                        smsCode: _pinPutController.text))
                    .then((value) async {
                  dbclass.getSpecificPhone(context, widget.phone);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const bottomnavigationbar()),
                  //     (route) => false);
                });
              } catch (e) {
                print('this is your error message ' + e.toString());
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                color: const Color(0xFF02C908),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'Verify Code',
                  style: GoogleFonts.workSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                    color: const Color(0xFF6C757D),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _pinPutController.text = '';
                _verifyPhone();
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xFF02C908),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Center(
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.workSans(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      color: const Color(0xFF6C757D),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+92${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => bottomnavigationbar()),
                  (route) => false);
            } else {
              print('show error that phone number is null !');
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          AlertDialog(
            title: Text('Error:' + e.message.toString()),
            icon: Icon(Icons.error),
          );
          print('this should show ' + e.message.toString());
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }
}
