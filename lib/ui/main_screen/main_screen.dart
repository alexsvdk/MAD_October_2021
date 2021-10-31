import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/ui/chat_screen/chat_screen.dart';
import 'package:ws_start/ui/profile_screen/profile_screen.dart';
import 'package:ws_start/ui/tinder_screen/tinder_screen.dart';

class MainScreen extends HookWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);
    return Scaffold(
        backgroundColor: ScarryColors.black,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: ScarryColors.black,
          currentIndex: selectedIndex.value,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: (i) => selectedIndex.value = i,
          items: [
            BottomNavigationBarItem(
                label: 'tinder',
                icon: _buildIcon(
                    'assets/images/tinder.png', selectedIndex.value == 0)),
            BottomNavigationBarItem(
                label: 'message',
                icon: _buildIcon(
                    'assets/images/message.png', selectedIndex.value == 1)),
            BottomNavigationBarItem(
                label: 'profile',
                icon: _buildIcon(
                    'assets/images/profile.png', selectedIndex.value == 2)),
          ],
        ),
        body: Builder(builder: (_) {
          switch (selectedIndex.value) {
            case 0:
              return TinderScreen();
            case 1:
              return ChatScreen();
            case 2:
              return ProfileScreen();
            default:
              throw UnimplementedError();
          }
        }));
  }

  Widget _buildIcon(String image, bool selected) {
    return SizedBox(
      height: 70,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (selected) Image.asset('assets/images/rect.png'),
          Image.asset(image)
        ],
      ),
    );
  }
}
