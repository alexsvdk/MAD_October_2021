import 'package:dio/dio.dart';
import 'package:ws_start/models/post.dart';

class Api {
  final Dio _client;

  Api(this._client);

  Future<Response<List<Post>>> fetchPosts() => _client.get<List<Post>>('posts');
}
