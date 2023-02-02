import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:sealed_bidd/splash/splashscreen.dart';

import 'Models/database.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (context) => Database(),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                    seedColor: const Color(0xFFF5F6F6),
                    primary: const Color(0xFF02C908)),
                primaryColor: const Color(0xFF02C908),
                backgroundColor: const Color(0xFFF5F6F6),
                primaryTextTheme: GoogleFonts.workSansTextTheme(),
              ),
              home: const Splash(),
            );
          })
    ]);
  }
}
