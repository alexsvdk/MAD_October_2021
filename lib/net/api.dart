import 'package:dio/dio.dart';
import 'package:ws_start/models/chats_respose.dart';
import 'package:ws_start/models/error.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/models/register.dart';
import 'package:ws_start/models/token.dart';
import 'package:ws_start/models/user.dart';

class Api {
  final Dio _client;

  Api(this._client);

  Future<Response<List>> fetchPosts() => _client.get('posts');

  Future<TokenResponse> register(RegisterRequest request) async {
    Response<Map<String, dynamic>>? res;
    int? statusCode;
    try {
      res = await _client.post<Map<String, dynamic>>('v1/auth/register',
          data: request.toJson());
      statusCode = 200;
    } on DioError catch (e) {
      if (e.response?.data != null) {
        e.error = ApiError.fromJson(e.response!.data! as Map<String, dynamic>);
        rethrow;
      }
    }
    final data = res?.data;
    if (data != null) {
      if (statusCode == 200) {
        return TokenResponse.fromJson(data);
      } else {
        throw DioError(
            requestOptions: res?.requestOptions ?? RequestOptions(path: ''),
            response: res,
            error: ApiError.fromJson(data));
      }
    }
    throw DioError(
      requestOptions: res?.requestOptions ?? RequestOptions(path: ''),
      response: res,
    );
  }

  Future<List<UserData>> getUsers() async {
    try {
      final res = await _client.get('v1/user', queryParameters: {
        'limit': 1000,
        'offset': 0,
      });
      res;
      final useres =
          (res.data as List).map((e) => UserData.fromJson(e)).toList();
      return useres;
    } on DioError catch (e) {
      if (e.response?.data != null) {
        e.error = ApiError.fromJson(e.response!.data! as Map<String, dynamic>);
      }
      rethrow;
    }
  }

  Future<void> likeUser(String userId) async {
    try {
      final res = await _client.post('/v1/user/$userId/like');
    } on DioError catch (e) {
      if (e.response?.data != null) {
        e.error = ApiError.fromJson(e.response!.data! as Map<String, dynamic>);
      }
      rethrow;
    }
  }

  Future<void> dislikeUser(String userId) async {
    try {
      final res = await _client.post('/v1/user/$userId/dislike');
    } on DioError catch (e) {
      if (e.response?.data != null) {
        e.error = ApiError.fromJson(e.response!.data! as Map<String, dynamic>);
      }
      rethrow;
    }
  }

  Future<List<ChatsResponse>> fetchChats() async {
    try {
      final res = await _client.get('/v1/chat');
      res;
      final useres =
          (res.data as List).map((e) => ChatsResponse.fromJson(e)).toList();
      return useres;
    } on DioError catch (e) {
      if (e.response?.data != null) {
        e.error = ApiError.fromJson(e.response!.data! as Map<String, dynamic>);
      }
      rethrow;
    }
  }
}
