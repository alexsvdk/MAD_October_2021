import 'package:flutter/material.dart';
import 'package:ws_start/colors.dart';

class ScarryContainer extends StatelessWidget {
  final Widget child;
  const ScarryContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          color: ScarryColors.purpleDark,
          padding: const EdgeInsets.all(14),
          child: child,
        ));
  }
}
