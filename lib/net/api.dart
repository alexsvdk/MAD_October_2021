import 'package:dio/dio.dart';
import 'package:ws_start/models/post.dart';

class Api {
  final Dio _client;

  Api(this._client);

  Future<Response<List>> fetchPosts() => _client.get('posts');
}
