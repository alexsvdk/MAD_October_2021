import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/ui/launch_screen/launch_screen.dart';
import 'package:ws_start/ui/posts_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) => ProviderScope(
          child: DefaultTextStyle(
              style: kBaseTextStyle, child: child ?? SizedBox.shrink())),
      home: LaunchScreen(),
    );
  }
}
