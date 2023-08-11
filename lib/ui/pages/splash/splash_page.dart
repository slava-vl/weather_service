import 'package:flutter/material.dart';

import 'widgets/main_title.dart';
import 'widgets/sub_title.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [theme.primaryColor, Colors.black],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: const Column(
          children: [
            MainTitle(),
            SubTitle(),
          ],
        ),
      ),
    );
  }
}
