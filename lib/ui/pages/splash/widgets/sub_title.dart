import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class SubTitle extends StatelessWidget {
  const SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          'dawn is coming soon',
          textAlign: TextAlign.left,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 24,
            height: 1.3,
            fontWeight: FontWeight.w300,
          ),
        ).animate().fade(delay: const Duration(milliseconds: 400)),
      ),
    );
  }
}
