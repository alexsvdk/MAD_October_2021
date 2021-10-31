import 'package:flutter/material.dart';
import 'package:ws_start/colors.dart';

import '../constants.dart';

class ScarryButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;
  const ScarryButton({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(14),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          boxShadow: kShadowScarryGlow,
          color: ScarryColors.orange,
        ),
        child: Text(
          text,
          style: const TextStyle(color: ScarryColors.black),
        ),
      ),
    );
  }
}
