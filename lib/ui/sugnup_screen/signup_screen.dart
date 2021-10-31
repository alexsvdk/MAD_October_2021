import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/data/auth.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/models/error.dart';
import 'package:ws_start/ui/profile_screen/profile_screen.dart';
import 'package:ws_start/widgets/scarry_button.dart';
import 'package:ws_start/widgets/scarry_container.dart';
import 'package:flutter_riverpod/all.dart';

import '../../constants.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = useTextEditingController();
    final pass = useTextEditingController();
    final pass2 = useTextEditingController();

    final authDataNotifyer = useProvider(authDataProvider);

    Future<void> _signUp() async {
      final emailText = email.text;
      final pass1Text = pass.text;
      final pass2Text = pass2.text;

      if (emailText.isEmpty || pass1Text.isEmpty || pass2Text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Fields must not be empty',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ScarryColors.red,
        ));
        return;
      }

      if (!emailText.contains('@')) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Invalid email',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ScarryColors.red,
        ));
        return;
      }

      if (pass1Text != pass2Text) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Passwords doesnt match',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ScarryColors.red,
        ));
        return;
      }

      try {
        await authDataNotifyer.register(emailText, pass1Text);
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const ProfileScreen()));
      } on DioError catch (e, s) {
        if (e.error is ApiError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              (e.error as ApiError).message,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: ScarryColors.red,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Ошибка соединения',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: ScarryColors.red,
          ));
        }
      }
    }

    return Scaffold(
      backgroundColor: ScarryColors.black,
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sign Up', style: kH1TextStyle),
                      const SizedBox(height: 5),
                      ScarryContainer(
                        child: TextField(
                          controller: email,
                          decoration:
                              kInputDecoration.copyWith(hintText: 'E-mail'),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ScarryContainer(
                        child: TextField(
                          controller: pass,
                          decoration:
                              kInputDecoration.copyWith(hintText: 'Password'),
                        ),
                      ),
                      const SizedBox(height: 5),
                      ScarryContainer(
                        child: TextField(
                          controller: pass2,
                          decoration: kInputDecoration.copyWith(
                              hintText: 'Repeat Password'),
                        ),
                      ),
                      Spacer(),
                      ScarryButton(text: 'Sign Up', onClick: _signUp),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
