import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_service/ui/pages/splash/splash_page.dart';

void main() {
  runApp(const WeatherServiceApp());
}

class WeatherServiceApp extends StatelessWidget {
  const WeatherServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(7, 0, 255, 1),
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.ubuntu(fontSize: 32, height: 36),
          headlineMedium: GoogleFonts.ubuntu(fontSize: 22, height: 28),
          bodyLarge: GoogleFonts.roboto(fontSize: 17, height: 24),
          bodyMedium: GoogleFonts.roboto(fontSize: 15, height: 22),
          bodySmall: GoogleFonts.roboto(fontSize: 13, height: 18),
        ),
      ),
      home: const SplashPage(),
    );
  }
}
