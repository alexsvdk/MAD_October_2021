import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/ui/sugnup_screen/signup_screen.dart';
import 'package:ws_start/widgets/scarry_button.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScarryColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
                child: Center(
              child: Text(
                'ScareMe',
                style: TextStyle(
                  fontFamily: 'JollyLodger',
                  fontSize: 100,
                  color: ScarryColors.orange,
                ),
              ),
            )),
            ScarryButton(
                text: 'Sign up',
                onClick: () {
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (_) => const SignUpScreen()));
                }),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(color: ScarryColors.red),
                )),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: ScarryColors.orange),
                )),
          ],
        ),
      ),
    );
  }
}
