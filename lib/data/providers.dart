import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/data/posts.dart';
import 'package:ws_start/net/providers.dart';

final postsDataProvider =
    StateNotifierProvider((ref) => PostsDataNotifyer(ref.watch(apiProvider)));
