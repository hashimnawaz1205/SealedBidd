import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

import 'optpscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  // void Submit(BuildContext context) async {
  //   var appSignatureId = await SmsAutoFill().getAppSignature;
  //   Map sendOptdata = {
  //     'mobile number': _controller.text,
  //     'app_signature_id': appSignatureId
  //   };
  //   print(sendOptdata.toString());
  //   Navigator.of(context).push(
  //       MaterialPageRoute(builder: (context) => OTPScreen(_controller.text)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phone Auth'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            Container(
              margin: EdgeInsets.only(top: 60),
              child: Center(
                child: Text(
                  'Phone Authentication',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  prefix: Padding(
                    padding: EdgeInsets.all(4),
                    child: Text('+92'),
                  ),
                ),
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            )
          ]),
          Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              //color: Colors.blue,
              onPressed: () {
                print(_controller.text.toString());
                if (_controller.text == '' ||
                    int.parse(_controller.text.length.toString()) < 9) {
                  showDialog(
                    context: context,
                    builder: ((context) {
                      return AlertDialog(
                        elevation: 2.0,
                        //backgroundColor: Colors.grey,
                        title: Text("Error"),
                        icon: Icon(
                          Icons.error,
                          color: const Color(0xFF02C908),
                        ),
                        content: Text("This phone number is invalid."),
                        actions: [
                          TextButton(
                            child: Text("ok"),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      );
                    }),
                  );
                } else {
                  print('will push next.');
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => OTPScreen(_controller.text),
                    ),
                  );
                }
              },
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
