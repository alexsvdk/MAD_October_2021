import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class AsyncStateNotifyer<T> extends StateNotifier<AsyncValue<T>> {
  AsyncStateNotifyer() : super(const AsyncValue.loading()) {
    refresh();
  }

  @protected
  Future<T> fetchData();

  Future<void> refresh() async {
    if (state.data?.value == null) state = const AsyncValue.loading();
    try {
      final data = await fetchData();
      state = AsyncValue.data(data);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
