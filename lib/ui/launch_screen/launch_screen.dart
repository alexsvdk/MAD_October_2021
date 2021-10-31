import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/ui/start_screen/start_screen.dart';

class LaunchScreen extends HookWidget {
  const LaunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timer = useEffect(() {
      final timer = Timer(const Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
            CupertinoPageRoute(builder: (_) => const StartScreen()));
      });
      return () {
        if (timer.isActive) timer.cancel();
      };
    });

    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    ScarryColors.purpleDark,
                    ScarryColors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0, 0.3])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 600,
                    height: 600,
                    decoration: const BoxDecoration(
                        gradient: RadialGradient(
                      colors: [ScarryColors.purple, Colors.transparent],
                      stops: [0.5, 1],
                    )),
                  ),
                  Image.asset(
                    'assets/images/logo.png',
                  ),
                ],
              ),
              const Text(
                'ScareMe',
                style: TextStyle(
                  fontFamily: 'JollyLodger',
                  fontSize: 100,
                  color: ScarryColors.orange,
                ),
              ),
            ],
          )),
    );
  }
}
