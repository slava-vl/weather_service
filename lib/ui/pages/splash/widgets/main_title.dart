import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Center(
        child: Text(
          'WEATHER SERVICE',
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 48,
            height: 1.2,
            fontWeight: FontWeight.w700,
          ),
        ).animate().fade(),
      ),
    );
  }
}
