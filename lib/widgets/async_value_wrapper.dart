import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/models/error.dart';

class AsyncValueWrapper<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T data, BuildContext context) buildData;

  const AsyncValueWrapper({
    Key? key,
    required this.value,
    required this.buildData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.map(
        data: (data) => buildData(data.value, context),
        loading: (data) => value.data?.value == null
            ? const CircularProgressIndicator()
            : buildData(data.data!.value, context),
        error: (AsyncError e) {
          String? errorText = e.toString();
          if (e.error is DioError && (e.error as DioError).error is ApiError) {
            errorText = (((e.error as DioError).error) as ApiError).message;
          }
          return Container(
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Ошибка зигрузки данных",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                if (errorText != null)
                  const SizedBox(
                    height: 4,
                  ),
                if (errorText != null) Text(errorText)
              ],
            ),
          );
        });
  }
}
