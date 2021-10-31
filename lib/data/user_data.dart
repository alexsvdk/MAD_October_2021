import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ws_start/arch/async_state_notifyer.dart';
import 'package:ws_start/models/user.dart';
import 'package:ws_start/net/api.dart';

class UserDataProvider extends AsyncStateNotifyer<List<UserData>> {
  final Api _api;

  UserDataProvider(this._api);

  void popUser() {
    if (state.data?.value != null) {
      state = AsyncValue.data([
        for (var i = 1; i < state.data!.value.length; i++) state.data!.value[i]
      ]);
    }
  }

  @override
  Future<List<UserData>> fetchData() => _api.getUsers();
}
