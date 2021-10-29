import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        error: (e) {
          String? errorText = e.toString();
          return Column(
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
          );
        });
  }
}
