import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../init.dart';
import '../auth/auth_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [theme.primaryColor.withOpacity(.44), Colors.black],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            TextButton(
                onPressed: () {
                  context.read<InitializeProvider>().authService.logout().then((value) =>
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage())));
                },
                child: const Text('Exit'))
          ],
        ),
      ),
    );
  }
}
