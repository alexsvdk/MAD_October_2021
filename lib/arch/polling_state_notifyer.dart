import 'dart:async';

import 'package:ws_start/arch/async_state_notifyer.dart';

mixin PollingStateNotifyerMixin<T> on AsyncStateNotifyer<T> {
  Timer? _timer;

  void startPolling({Duration dealay = const Duration(seconds: 3)}) {
    stopPolling();
    _timer = Timer.periodic(dealay, (_) => refresh());
  }

  void stopPolling() {
    _timer?.cancel();
    _timer = null;
  }
}
