import 'package:dio/dio.dart';
import 'package:ws_start/models/error.dart';
import 'package:ws_start/models/post.dart';
import 'package:ws_start/models/register.dart';
import 'package:ws_start/models/token.dart';

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
      if (e.response != null) {
        e.error = ApiError.fromJson(e.response as Map<String, dynamic>);
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
}
