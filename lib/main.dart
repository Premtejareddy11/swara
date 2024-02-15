import 'package:flutter/material.dart';
import 'package:swara_ui/login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swara_ui/navigator_bottom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // scaffoldBackgroundColor: Color.fromARGB(255, 228, 228, 228),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color.fromARGB(255, 53, 193, 212),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // primaryColor: Color.fromARGB(255, 177, 181, 70),
        // ignore: deprecated_member_use
        // accentColor: const Color.fromARGB(255, 70, 143, 175),
        indicatorColor: const Color.fromARGB(255, 213, 177, 116),
        // secondaryHeaderColor: const Color.fromARGB(255, 222, 234, 230),
        secondaryHeaderColor: const Color.fromARGB(149, 24, 155, 118),
        // hintColor: Color.fromARGB(194, 222, 199, 87),global
        // hintColor: const Color.fromARGB(255, 222, 234, 230),
        textTheme: (TextTheme(
          titleLarge:
              GoogleFonts.openSans(fontSize: 22, fontWeight: FontWeight.w700),
          titleSmall:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w600),
          headlineSmall: const TextStyle(
              color: Color.fromARGB(219, 30, 27, 27),
              fontWeight: FontWeight.w500),
          titleMedium: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          bodySmall: GoogleFonts.openSans(fontSize: 12),
          bodyMedium:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500),
          bodyLarge: GoogleFonts.openSans(fontSize: 16),
          displayMedium: GoogleFonts.openSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 101, 99, 99),
          ),
          displaySmall:
              GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w700),
          displayLarge: GoogleFonts.openSans(
              color: const Color.fromARGB(219, 30, 27, 27),
              fontSize: 20,
              fontWeight: FontWeight.w900),
          labelLarge:
              GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w700),
          labelMedium:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
          labelSmall:
              GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.normal),
        )),
      ),
      home: const NavigatorBottom(),
    );
  }
}
