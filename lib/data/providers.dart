import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/data/posts.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/net/providers.dart';

final postsDataProvider =
    StateNotifierProvider<PostsDataNotifyer, AsyncValue<List<Post>>>(
        (ref) => PostsDataNotifyer(ref.watch(apiProvider)));
