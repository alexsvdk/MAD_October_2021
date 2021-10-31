import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/models/token.dart';
import 'package:ws_start/ui/main_screen/main_screen.dart';
import 'package:ws_start/widgets/scarry_button.dart';

class TokenScreen extends HookWidget {
  const TokenScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = useTextEditingController();
    useEffect(() {
      token.text = Constants.defaultToken;
      return () {};
    });
    final auth = useProvider(authDataProvider);

    return Scaffold(
      backgroundColor: ScarryColors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Enter Token",
              style: kH1TextStyle,
            ),
            TextField(
              controller: token,
            ),
            ScarryButton(
                text: 'GO',
                onClick: () {
                  auth.setToken(TokenResponse(token.text, '', '', ''));
                  Navigator.of(context).push(
                      CupertinoPageRoute(builder: (_) => const MainScreen()));
                })
          ],
        ),
      ),
    );
  }
}
