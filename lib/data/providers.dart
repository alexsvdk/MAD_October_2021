import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ws_start/data/auth.dart';
import 'package:ws_start/data/chats.dart';
import 'package:ws_start/data/posts.dart';
import 'package:ws_start/data/user_actions.dart';
import 'package:ws_start/data/user_data.dart';
import 'package:ws_start/models/auth.dart';
import 'package:ws_start/models/chats_respose.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/models/token.dart';
import 'package:ws_start/models/user.dart';
import 'package:ws_start/net/providers.dart';

final postsDataProvider =
    StateNotifierProvider<PostsDataNotifyer, AsyncValue<List<Post>>>(
        (ref) => PostsDataNotifyer(
              ref.watch(apiProvider),
            ));

final authDataProvider = Provider((ref) => AuthDataNotifyer(
      ref.watch(apiProvider),
    ));

final usersProvider =
    StateNotifierProvider<UserDataProvider, AsyncValue<List<UserData>>>(
        (ref) => UserDataProvider(ref.watch(apiProvider)));

final userAcrionsProvider = Provider((ref) => UserActionsProvider(
    ref.watch(apiProvider), ref.watch(usersProvider.notifier)));

final chatsProvider =
    StateNotifierProvider<ChatDataProvider, AsyncValue<List<ChatsResponse>>>(
        (ref) => ChatDataProvider(ref.watch(apiProvider)));
