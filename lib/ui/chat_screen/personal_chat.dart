import 'package:flutter/material.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/models/chats_respose.dart';
import 'package:ws_start/ui/tinder_screen/tinder_screen.dart';

class PersonalChatScreen extends StatelessWidget {
  final ChatsResponse data;
  const PersonalChatScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ScarryColors.black,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(8),
        color: ScarryColors.black,
        child: Row(
          children: [
            Expanded(
              child: TextField(),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButton(),
            Expanded(
              child: Text('тут чат'),
            ),
            Row(
              children: [
                Expanded(child: TextField()),
                TinderScreen.buildBtn('assets/images/message.png', () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
