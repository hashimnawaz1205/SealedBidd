import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sealed_bidd/IntroScreens/boardingscreen.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const BoardingScreen(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            child: Image.asset('assets/images/splash.png'),
          ),
          SizedBox(
            width: 50.0,
            child: LinearProgressIndicator(
              color: Colors.green,
              minHeight: 2.0,
            ),
          ),
        ],
      ),
    );
  }
}
