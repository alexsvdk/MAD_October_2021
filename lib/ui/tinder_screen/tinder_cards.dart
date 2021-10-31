import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/colors.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/data/providers.dart';
import 'package:ws_start/data/user_data.dart';
import 'package:ws_start/models/user.dart';
import 'package:ws_start/ui/tinder_screen/tinder_behavior.dart';
import 'package:ws_start/widgets/async_value_wrapper.dart';
import 'package:ws_start/widgets/scarry_button.dart';

class TinderCards extends HookWidget {
  const TinderCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = useProvider(usersProvider);
    final userActions = useProvider(userAcrionsProvider);
    return AsyncValueWrapper<List<UserData>>(
      value: userData,
      buildData: (data, context) {
        return Stack(
          children: [
            for (int i = 0; i < data.length && i < 3; i++)
              if (i == 0)
                TinderBehavior(
                  right: userActions.like,
                  left: userActions.dislike,
                  child: _buildCard(data[i]),
                )
              else
                Transform.scale(
                  scale: 1.0 / (i * 0.1 + 1),
                  child: _buildCard(data[i]),
                ),
          ].reversed.toList(),
        );
      },
    );
  }

  Widget _buildCard(UserData user) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          if (user.avatar != null)
            Image.network(
              user.avatar!,
              fit: BoxFit.cover,
              height: double.infinity,
            )
          else
            Container(color: ScarryColors.purpleDark),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: ScarryColors.purpleDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  user.name,
                  style: kH3TextStyle,
                ),
                Text(
                  '${user.topics.length} Matches',
                  style: kH3TextStyle.copyWith(color: ScarryColors.orange),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
