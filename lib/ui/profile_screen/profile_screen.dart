import 'package:flutter/material.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScarryColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Why are you scary?',
              style: kH1TextStyle,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: kShadowScarryGlow,
                color: ScarryColors.purpleDark,
                borderRadius: BorderRadius.circular(1000),
              ),
              child: Image.asset('assets/images/logo.png'),
            )
          ],
        ),
      ),
    );
  }
}
