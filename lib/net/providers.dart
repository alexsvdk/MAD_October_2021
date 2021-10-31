import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ws_start/constants.dart';
import 'package:ws_start/data/auth.dart';
import 'package:ws_start/net/api.dart';

final authInterceptorProvider = Provider((ref) => InterceptorsWrapper(
      onRequest: (
        RequestOptions options,
        RequestInterceptorHandler handler,
      ) {
        handler.next(options.copyWith(headers: {
          ...options.headers,
          if (AuthDataNotifyer.token != null)
            "Authorization": 'Bearer ${AuthDataNotifyer.token}'
        }));
      },
    ));

final dioProvider = Provider(
  (ref) => Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
    contentType: 'application/json',
  ))
    ..interceptors.add(ref.watch(authInterceptorProvider)),
);

final apiProvider = Provider((ref) => Api(ref.watch(dioProvider)));
