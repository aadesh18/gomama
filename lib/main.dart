import 'package:flutter/material.dart';
import 'package:gomama/database.dart';
import 'package:gomama/screens/splash_screen.dart';
import 'package:gomama/screens/welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  ///Database.getMatch("jdoe", "8 am to 11 am");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.x
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: _buildTheme(),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }

  ThemeData _buildTheme() {
    var baseTheme = ThemeData(
      colorScheme: ColorScheme.light(
          background: Colors.pink.shade50,
          onBackground: Colors.black,
          primary: Color.fromRGBO(206, 147, 216, 1),
          onPrimary: Colors.black,
          secondary: Color.fromRGBO(244, 143, 177, 1),
          onSecondary: Colors.white,
          tertiary: Color.fromRGBO(255, 204, 128, 1),
          error: Colors.red,
          outline: Color(0xFF424242)),
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }
}
