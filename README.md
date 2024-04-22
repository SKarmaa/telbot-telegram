# Documentation

Before trying to use this library, make sure your computer has it installed [TDLIB](https://github.com/tdlib/td/)

## Quickstart

```dart
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
```

### Call Method

currently everything isn't built into dart so we can call the api using json data

  Full Method List: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html


- Example Send Message: https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1send_message.html
  
```dart
  Map send_message = await tdlib.invoke(
    "sendMessage",
    parameters: {
      "chat_id": 0,
      "options": {
        "@type": "messageSendOptions",
        "disable_notification": true,
      },
      "input_message_content": {
        "@type": "inputMessageText",
        "text": tdlib.invokeSync(
          "parseTextEntities",
          parameters: {
            "parse_mode": {
              "@type": "textParseModeHTML",
            },
            "text": "Hai ${TgUtils.parseHtmlBold("Slebew")}"
          },
        ),
        "disable_web_page_preview": false,
      }
    },
    clientId: tdlib.client_id,
  );
  send_message.printPretty();
```

### Add New client

This library is designed to make it very easy to add clients without adding a lot of scripts so it can fit up to hundreds of accounts depending on device specs


```dart
  tdlib.on(tdlib.event_update, (UpdateTd updateTd) async {
    // If you want to call the function method, make sure we replace id with id like the print script below
    print("CLIENT Number: ${updateTd.client_id}");
  });
  // If you want to add more, please just call the method below as many times as you want
  await tdlib.initIsolateNewClient(
    clientId: tdlib.td_create_client_id(),
    clientOption: {
      // Make sure the database directory path is different from the others
      "database_directory": "path_to_folder_session_account_new/",
    },
  );
```
