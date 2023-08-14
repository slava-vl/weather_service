import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../init.dart';
import '../auth/auth_page.dart';
import '../home/home_page.dart';
import 'widgets/main_title.dart';
import 'widgets/sub_title.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  void initializeApp() {
    Future.wait([
      Future.delayed(const Duration(seconds: 2)),
      context.read<InitializeProvider>().initializeApp(),
    ]).then((value) {
      final isAuth = context.read<InitializeProvider>().authService.isAuth();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => isAuth ? const HomePage() : const AuthPage()));
    });
  }

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
