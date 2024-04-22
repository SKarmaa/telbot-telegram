// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

void main(List<String> args) async {
  print("Start Program");
  Tdlib tdlib = Tdlib(
    pathTdl: "path_to_tdlib/libtdjson.so",
    clientOption: {
      // get from telegram
      "api_id": 0,
      "api_hash": "",
    },
  );

  tdlib.on(tdlib.event_update, (UpdateTd updateTd) async {
    Map update = updateTd.update;

    if (update["@type"] == "updateAuthorizationState") {
      if (update["authorization_state"] is Map) {
        Map authorization_state = update["authorization_state"];
        if (authorization_state["@type"] == "authorizationStateWaitPhoneNumber") {
          Map res = await tdlib.invoke(
            "setAuthenticationPhoneNumber",
            parameters: {
              "phone_number": "62xxx",
            },
            clientId: updateTd.client_id,
          );
          print(res);
        }

        if (authorization_state["@type"] == "authorizationStateWaitCode") {
          Map res = await tdlib.invoke(
            "checkAuthenticationCode",
            parameters: {
              "code": "xxxxx",
            },
            clientId: updateTd.client_id,
          );
          print(res);
        }

        if (authorization_state["@type"] == "authorizationStateReady") {
          Map get_me = await tdlib.invoke(
            "getMe",
            clientId: updateTd.client_id,
          );
          get_me.printPretty();
        }
      }
    }
  });

  await tdlib.initIsolate();
  print("Client running...");


}
