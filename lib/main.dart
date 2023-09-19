// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trizzled_movies/pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trizzled_movies/pages/login_screen.dart';
import 'package:trizzled_movies/pages/otp_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login_screen',
    routes: {
      'login_screen': (context) => LoginScreen(),
      'otp_screen': (context) => OtpPage(),
      'home_screen': (context) => MyHomeScreen(),
    },
  ));
}

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     initialRoute: 'home_screen',
//     routes: {
//       // 'login_screen': (context) => LoginScreen(),
//       // 'otp_screen': (context) => OtpPage(),
//       'home_screen': (context) => MyHomeScreen(),
//     },
//   ));
// }
