import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'firebase_options.dart';
import 'init.dart';
import 'ui/pages/splash/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const WeatherServiceApp());
}

class WeatherServiceApp extends StatelessWidget {
  const WeatherServiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => InitializeProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color.fromRGBO(7, 0, 255, 1),
          textTheme: TextTheme(
            headlineLarge: GoogleFonts.ubuntu(fontSize: 32, height: 1.2),
            headlineMedium: GoogleFonts.ubuntu(fontSize: 22, height: 1.2),
            bodyLarge: GoogleFonts.roboto(fontSize: 17, height: 1.5),
            bodyMedium: GoogleFonts.roboto(fontSize: 15, height: 1.5),
            bodySmall: GoogleFonts.roboto(fontSize: 13, height: 1.5),
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
