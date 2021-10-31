import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/ui/tinder_screen/tinder_cards.dart';
import 'package:supercharged_dart/supercharged_dart.dart';

import '../../colors.dart';
import '../../constants.dart';

class TinderScreen extends HookWidget {
  const TinderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userActions = useProvider(userAcrionsProvider);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ScarryColors.purpleDark,
            borderRadius: BorderRadius.circular(32),
          ),
          height: 344,
        ),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Trick or Treat?',
              style: kH1TextStyle,
            ),
            Expanded(child: const TinderCards()),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildBtn('assets/images/rip.png', userActions.dislike),
                buildBtn('assets/images/candy.png', userActions.like),
              ],
            ),
          ]),
        )),
      ],
    );
  }

  static Widget buildBtn(String img, VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
            color: ScarryColors.purpleDark,
            borderRadius: BorderRadius.circular(100)),
        child: Image.asset(
          img,
          width: 50,
          height: 50,
        ),
      ),
    );
  }
}
