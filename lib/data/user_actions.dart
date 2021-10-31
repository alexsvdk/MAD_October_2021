import 'package:ws_start/data/user_data.dart';
import 'package:ws_start/net/api.dart';

class UserActionsProvider {
  final Api _api;
  final UserDataProvider _userDataProvider;

  UserActionsProvider(this._api, this._userDataProvider);

  Future<void> like() async {
    await _api.likeUser(_userDataProvider.state.data!.value.first.userId);
    _userDataProvider.popUser();
  }

  Future<void> dislike() async {
    await _api.dislikeUser(_userDataProvider.state.data!.value.first.userId);
    _userDataProvider.popUser();
  }
}
