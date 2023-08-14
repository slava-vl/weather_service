import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../init.dart';
import '../home/home_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordObscure = true;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Вход',
              style: theme.textTheme.headlineLarge!
                  .copyWith(color: const Color.fromRGBO(43, 45, 51, 1), fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Text(
              'Введите данные для входа',
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: const Color.fromRGBO(135, 153, 165, 1), fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    cursorColor: const Color.fromRGBO(255, 88, 93, 1),
                    decoration: InputDecoration(
                      border:
                          const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(228, 230, 236, 1))),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: theme.primaryColor)),
                      labelText: 'Email',
                      labelStyle: theme.textTheme.bodyLarge!
                          .copyWith(color: const Color.fromRGBO(135, 153, 165, 1), height: .7),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Поле должно быть заполнено';
                      }
                      final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(text);
                      if (emailValid) return null;
                      return 'Введите корректный Email';
                    },
                  ),
                  const SizedBox(height: 32),
                  TextFormField(
                    controller: _passwordController,
                    cursorColor: const Color.fromRGBO(255, 88, 93, 1),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashRadius: 25,
                        icon: SvgPicture.asset(
                            isPasswordObscure ? 'assets/svg_icons/eye_closed.svg' : 'assets/svg_icons/eye_opened.svg'),
                        onPressed: () {
                          setState(() {
                            isPasswordObscure = !isPasswordObscure;
                          });
                        },
                      ),
                      border:
                          const UnderlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(228, 230, 236, 1))),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: theme.primaryColor)),
                      labelText: 'Пароль',
                      labelStyle: theme.textTheme.bodyLarge!
                          .copyWith(color: const Color.fromRGBO(135, 153, 165, 1), height: .7),
                    ),
                    obscureText: isPasswordObscure,
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return 'Поле должно быть заполнено';
                      }
                      if (text.length < 8) {
                        return 'Пароль должен содержать не менее 8 символов';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<InitializeProvider>()
                              .authService
                              .signIn(_emailController.text, _passwordController.text)
                              .then((value) {
                            if (value == null) {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
                            }
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      ),
                      child: Text(
                        'Войти',
                        style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
