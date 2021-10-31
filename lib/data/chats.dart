import 'package:ws_start/arch/async_state_notifyer.dart';
import 'package:ws_start/arch/polling_state_notifyer.dart';
import 'package:ws_start/models/chats_respose.dart';
import 'package:ws_start/net/api.dart';

class ChatDataProvider extends AsyncStateNotifyer<List<ChatsResponse>>
    with PollingStateNotifyerMixin {
  final Api _api;
  ChatDataProvider(this._api) {
    startPolling(dealay: const Duration(seconds: 30));
  }
  @override
  Future<List<ChatsResponse>> fetchData() async {
    final res = await _api.fetchChats();
    return res;
  }
}
