import 'package:dio/dio.dart';
import 'package:ws_start/arch/async_state_notifyer.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/net/api.dart';

class PostsDataNotifyer extends AsyncStateNotifyer<List<Post>> {
  final Api _api;

  PostsDataNotifyer(this._api);

  @override
  Future<List<Post>> fetchData() async {
    final res = await _api.fetchPosts();
    final data = res.data;
    if (data != null) return data.map((e) => Post.fromJson(e)).toList();
    throw DioError(requestOptions: res.requestOptions, response: res);
  }
}
