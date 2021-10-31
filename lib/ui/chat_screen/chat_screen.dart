import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/models/chats_respose.dart';
import 'package:ws_start/ui/chat_screen/personal_chat.dart';
import 'package:ws_start/widgets/async_value_wrapper.dart';

class ChatScreen extends HookWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chats = useProvider(chatsProvider);
    return SafeArea(
      child: AsyncValueWrapper<List<ChatsResponse>>(
        value: chats,
        buildData: (data, context) => Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              Text(
                'Messages',
                style: kH1TextStyle,
              ),
              ...data.map((data) => _buildChat(data, context))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChat(ChatsResponse chat, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            CupertinoPageRoute(builder: (_) => PersonalChatScreen(data: chat)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: chat.chat.avatar != null
                  ? CachedNetworkImage(
                      imageUrl: chat.chat.avatar!,
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      color: Colors.brown,
                      width: 70,
                      height: 70,
                    ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(chat.chat.title),
                if (chat.lastMessage != null) ...[
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    chat.lastMessage!.text,
                    maxLines: 2,
                  ),
                ],
                Divider(
                  color: ScarryColors.orange,
                  height: 3,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
