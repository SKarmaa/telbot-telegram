/* <!-- START LICENSE -->


Program Ini Di buat Oleh DEVELOPER Dari PERUSAHAAN GLOBAL CORPORATION 
Social Media: 

- Youtube: https://youtube.com/@Global_Corporation 
- Github: https://github.com/globalcorporation
- TELEGRAM: https://t.me/GLOBAL_CORP_ORG_BOT

Seluruh kode disini di buat 100% murni tanpa jiplak / mencuri kode lain jika ada akan ada link komment di baris code

Jika anda mau mengedit pastikan kredit ini tidak di hapus / di ganti!

Jika Program ini milik anda dari hasil beli jasa developer di (Global Corporation / apapun itu dari turunan itu jika ada kesalahan / bug / ingin update segera lapor ke sub)

Misal anda beli Beli source code di Slebew CORPORATION anda lapor dahulu di slebew jangan lapor di GLOBAL CORPORATION!

Jika ada kendala program ini (Pastikan sebelum deal project tidak ada negosiasi harga)
Karena jika ada negosiasi harga kemungkinan

1. Software Ada yang di kurangin
2. Informasi tidak lengkap
3. Bantuan Tidak Bisa remote / full time (Ada jeda)

Sebelum program ini sampai ke pembeli developer kami sudah melakukan testing

jadi sebelum nego kami sudah melakukan berbagai konsekuensi jika nego tidak sesuai ? 
Bukan maksud kami menipu itu karena harga yang sudah di kalkulasi + bantuan tiba tiba di potong akhirnya bantuan / software kadang tidak lengkap


<!-- END LICENSE --> */
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, unnecessary_type_check, void_checks, unnecessary_brace_in_string_interps, empty_catches, unused_local_variable, constant_identifier_names

// ignore: slash_for_doc_comments
//

import 'dart:async';
import 'dart:ffi' as ffi;
// import 'dart:ffi';
import 'dart:convert' as convert;

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/isolate/isolate.dart';
import 'package:telegram_client/scheme/scheme.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib_isolate.dart';
import 'package:telegram_client/tdlib/tdlib_isolate_data.dart';
import 'package:telegram_client/tdlib/tdlib_isolate_receive_data.dart';
import 'package:telegram_client/tdlib/update_td.dart';
import 'package:universal_io/io.dart';
import 'package:ffi/ffi.dart' as pkgffi;

/// Cheatset
///
/// ```dart
/// Tdlib tg = Tdlib(
///  pathTdl: "libtdjson.so",
///  clientOption: {
///   "api_id": 121315,
///   "api_hash": "saskaspasad"
///  },
/// );
/// tg.on("update", (UpdateTd update) async {
///   print(update.raw);
/// });
/// tg.initIsolate();
/// ````
///
class LibTdJson {
  ReceivePort receivePort = ReceivePort();
  Map client_option = {
    'api_id': 94575,
    'api_hash': 'a3406de8d171bb422bb6ddf3bbd800e2',
    'database_directory': "tg_db",
    'files_directory': "tg_file",
    "use_file_database": true,
    "use_chat_info_database": true,
    "use_message_database": true,
    "use_secret_chats": true,
    'enable_storage_optimizer': true,
    'system_language_code': 'en',
    'new_verbosity_level': 0,
    'application_version': 'v1',
    'device_model': 'Telegram Client HexaMinate @azkadev Galaxeus',
    'system_version': Platform.operatingSystemVersion,
    "database_key": "",
    "start": true,
  };
  // late SendPort sendPort;
  late Isolate isolate;
  bool is_init_isolate = false;
  // bool is_init_send_port = false;
  late String path_tdlib;
  bool is_cli;
  bool is_android = Platform.isAndroid;
  // List<TdlibClient> clients = [];

  Map<int, TdlibClient> clients = {};
  // Map<int, TdlibClient> client = {};
  int client_id = 0;
  int task_count = 0;
  String event_invoke = "invoke";
  String event_update = "update";
  EventEmitter event_emitter = EventEmitter();
  Duration? delay_update;
  Duration delay_invoke = Duration(milliseconds: 1);
  bool is_auto_get_chat = false;
  Duration invoke_time_out = Duration(minutes: 10);
  double timeOutUpdate;
  bool is_invoke_throw_on_error = false;
  FutureOr<void> Function(dynamic update, LibTdJson libTdJson)?
      on_receive_update;
  FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
      on_generate_extra_invoke;
  FutureOr<Map> Function(String extra, int client_id, LibTdJson libTdJson)?
      on_get_invoke_data;
  LibTdJson({
    String? pathTdl,
    Map? clientOption,
    this.is_cli = false,
    this.event_invoke = "invoke",
    this.event_update = "update",
    EventEmitter? eventEmitter,
    Duration? delayUpdate,
    this.timeOutUpdate = 1.0,
    Duration? delayInvoke,
    Duration? invokeTimeOut,
    bool isAutoGetChat = false,
    bool isInvokeThrowOnError = true,
    this.on_generate_extra_invoke,
    this.on_get_invoke_data,
    this.on_receive_update,
  }) {
    if (delayInvoke != null) {
      delay_invoke = delayInvoke;
    }
    delay_update = delayUpdate;

    is_invoke_throw_on_error = isInvokeThrowOnError;
    pathTdl ??= "libtdjson.${getFormatLibrary}";
    path_tdlib = pathTdl;
    is_auto_get_chat = isAutoGetChat;
    invokeTimeOut ??= Duration(minutes: 5);
    invoke_time_out = invokeTimeOut;
    if (eventEmitter != null) {
      event_emitter = eventEmitter;
    }

    if (clientOption != null) {
      client_option.addAll(clientOption);
      if (clientOption["is_android"] == true) {
        is_android = true;
      }
    }

    receivePort.listen((update) async {
      if (update is SendPort) {
        // sendPort = update;
        // is_init_send_port = true;
        return;
      }
      if (on_receive_update != null) {
        await on_receive_update!(update, this);
      } else if (update is TdlibIsolateReceiveData) {
        TdlibIsolateReceiveData tdlibIsolateReceiveData = update;
        try {
          if (tdlibIsolateReceiveData.updateData["@extra"] is String) {
            event_emitter.emit(event_invoke, null, tdlibIsolateReceiveData);
          } else {
            event_emitter.emit(event_update, null, tdlibIsolateReceiveData);
          }
        } catch (e) {
          event_emitter.emit(event_update, null, tdlibIsolateReceiveData);
        }
      } else if (update is TdlibIsolateReceiveDataError) {
        is_init_isolate = false;
        await initIsolate();
      }
    });
  }

  void task_increase() {
    if (task_count < 0) {
      task_count = 0;
    }
    task_count += 1;
  }

  void task_decrease() {
    task_count -= 1;
    if (task_count < 0) {
      task_count = 0;
    }
  }

  String get getFormatLibrary {
    if (Platform.isAndroid || Platform.isLinux) {
      return "so";
    } else if (Platform.isIOS || Platform.isMacOS) {
      return "dylib";
    } else {
      return "dll";
    }
  }

  Future<void> init() async {
    return;
  }

  ffi.DynamicLibrary get tdLib {
    if (Platform.isIOS || Platform.isMacOS) {
      if (is_cli) {
        return ffi.DynamicLibrary.open(path_tdlib);
      } else {
        return ffi.DynamicLibrary.process();
      }
    } else {
      return ffi.DynamicLibrary.open(path_tdlib);
    }
  }

  /// create client id for multi client
  int td_create_client_id() {
    // pkgffi;
    int client_id_new = tdLib
        .lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>(
            '${is_android ? "_" : ""}td_create_client_id')
        .call()
        .address;

    return client_id_new;
  }

  /// create client id for multi client
  int td_json_client_create() {
    // pkgffi;
    int client_id_new = tdLib
        .lookupFunction<ffi.Pointer Function(), ffi.Pointer Function()>(
            '${is_android ? "_" : ""}td_json_client_create')
        .call()
        .address;

    return client_id_new;
  }

  ffi.Pointer client_id_addres(int clientId) {
    return ffi.Pointer.fromAddress(clientId);
  }

  /// td_send
  void td_send(int clientId, [Map? parameters]) {
    ffi.Pointer client_id_addres_data = client_id_addres(clientId);
    ffi.Pointer<pkgffi.Utf8> request_data =
        convert.json.encode(parameters).toNativeUtf8();
    tdLib
        .lookupFunction<
                ffi.Void Function(
                    ffi.Pointer client, ffi.Pointer<pkgffi.Utf8> request),
                void Function(
                    ffi.Pointer client, ffi.Pointer<pkgffi.Utf8> request)>(
            '${is_android ? "_" : ""}td_send')
        .call(client_id_addres_data, request_data);
    pkgffi.malloc.free(request_data);
    return;
  }

  /// td_send
  void td_json_client_send(int clientId, [Map? parameters]) {
    ffi.Pointer client_id_addres_data = client_id_addres(clientId);
    ffi.Pointer<pkgffi.Utf8> request_data =
        convert.json.encode(parameters).toNativeUtf8();
    tdLib
        .lookupFunction<
                ffi.Void Function(
                    ffi.Pointer client, ffi.Pointer<pkgffi.Utf8> request),
                void Function(
                    ffi.Pointer client, ffi.Pointer<pkgffi.Utf8> request)>(
            '${is_android ? "_" : ""}td_json_client_send')
        .call(client_id_addres_data, request_data);
    pkgffi.malloc.free(request_data);
    return;
  }

  /// client_execute
  Map<String, dynamic> td_execute(Map parameters) {
    ffi.Pointer<pkgffi.Utf8> request_data =
        convert.json.encode(parameters).toNativeUtf8();
    ffi.Pointer<pkgffi.Utf8> result = tdLib
        .lookupFunction<
            ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer<pkgffi.Utf8>),
            ffi.Pointer<pkgffi.Utf8> Function(
                ffi.Pointer<pkgffi.Utf8>)>('${is_android ? "_" : ""}td_execute')
        .call(request_data);
    Map<String, dynamic> result_data =
        convert.json.decode(result.toDartString());
    pkgffi.malloc.free(request_data);

    return result_data;
  }

  /// client_execute
  Map<String, dynamic> td_json_client_execute(int clientId, [Map? parameters]) {
    ffi.Pointer client_id_addres_data = client_id_addres(clientId);
    ffi.Pointer<pkgffi.Utf8> request_data =
        convert.json.encode(parameters).toNativeUtf8();
    ffi.Pointer<pkgffi.Utf8> result = tdLib
        .lookupFunction<
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Pointer<pkgffi.Utf8>),
                ffi.Pointer<pkgffi.Utf8> Function(
                    ffi.Pointer, ffi.Pointer<pkgffi.Utf8>)>(
            '${is_android ? "_" : ""}td_json_client_execute')
        .call(client_id_addres_data, request_data);
    Map<String, dynamic> result_data =
        convert.json.decode(result.toDartString());
    pkgffi.malloc.free(request_data);

    return result_data;
  }

  /// client_destroy
  void td_json_client_destroy(int clientId) {
    ffi.Pointer client_id_addres_data = client_id_addres(clientId);
    tdLib
        .lookupFunction<
            ffi.Void Function(ffi.Pointer),
            void Function(
                ffi.Pointer)>('${is_android ? "_" : ""}td_json_client_destroy')
        .call(client_id_addres_data);

    return;
  }

  /// fetch update
  Map<String, dynamic>? td_receive({
    double timeout = 1.0,
  }) {
    try {
      // ffi.Pointer client_id_addres_data = client_id_addres(clientId);
      ffi.Pointer<pkgffi.Utf8> update = tdLib
          .lookupFunction<
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Double),
              ffi.Pointer<pkgffi.Utf8> Function(
                  double)>('${is_android ? "_" : ""}td_receive')
          .call(timeout);
      if (update.address != 0 &&
          update.toDartString() is String &&
          update.toDartString().toString().isNotEmpty) {
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      } else {}
    } catch (e) {}
    return null;
  }

  /// fetch update
  static Map<String, dynamic>? td_receive_static({
    required String path_tdlib,
    double timeout = 1.0,
  }) {
    try {
      // ffi.Pointer client_id_addres_data = client_id_addres(clientId);
      ffi.Pointer<pkgffi.Utf8> update = ffi.DynamicLibrary.open(path_tdlib)
          .lookupFunction<
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Double),
              ffi.Pointer<pkgffi.Utf8> Function(
                  double)>('${Platform.isAndroid ? "_" : ""}td_receive')
          .call(timeout);
      if (update.address != 0 &&
          update.toDartString() is String &&
          update.toDartString().toString().isNotEmpty) {
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      } else {}
    } catch (e) {}
    return null;
  }

  /// fetch update
  Map<String, dynamic>? td_json_client_receive(int clientId,
      [double timeout = 0.001]) {
    try {
      ffi.Pointer client_id_addres_data = client_id_addres(clientId);
      ffi.Pointer<pkgffi.Utf8> update = tdLib
          .lookupFunction<
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer, ffi.Double),
              ffi.Pointer<pkgffi.Utf8> Function(ffi.Pointer,
                  double)>('${is_android ? "_" : ""}td_json_client_receive')
          .call(client_id_addres_data, timeout);
      if (update.address != 0 &&
          update.toDartString() is String &&
          update.toDartString().toString().isNotEmpty) {
        Map<String, dynamic>? updateOrigin;
        try {
          updateOrigin = convert.json.decode(update.toDartString());
        } catch (e) {}
        if (updateOrigin != null) {
          return updateOrigin;
        }
      } else {}
    } catch (e) {}
    return null;
  }

  /// add this for multithread on flutter apps
  Future<Map> initIsolate({
    int? clientId,
    int clientUserId = 0,
    Map? clientOption,
    bool isVoid = false,
  }) async {
    clientId ??= client_id;
    Map client_new_option = client_option.clone();
    if (clientOption != null) {
      client_new_option.addAll(clientOption);
    }
    TdlibClient tdlibClient = TdlibClient(
      client_id: clientId,
      client_user_id: clientUserId,
      client_option: client_new_option,
    );
    if ((is_init_isolate == false)) {
      TdlibIsolateData tdlibIsolateData = TdlibIsolateData(
        sendPort: receivePort.sendPort,
        tdlibClient: tdlibClient,
        pathTdlib: path_tdlib,
        isAndroid: is_android,
        delayUpdate: delay_update,
        timeOutUpdate: timeOutUpdate,
      );
      isolate = await Isolate.spawn<TdlibIsolateData>(
        tdlibIsolate,
        tdlibIsolateData,
        onExit: receivePort.sendPort,
        onError: receivePort.sendPort,
      );
      clients[clientId] = tdlibClient;
      is_init_isolate = true;
    } else {
      // sendPort.send(tdlibClient);
      clients[clientId] = tdlibClient;
    }

    return await invoke(
      "setTdlibParameters",
      parameters: client_new_option,
      clientId: clientId,
      isVoid: isVoid,
      isUseCache: false,
      durationCacheExpire: null,
      isInvokeThrowOnError: false,
    );
  }

  /// add this for multithread new client on flutter apps
  Future<Map> initIsolateNewClient({
    required int clientId,
    required Map clientOption,
    int clientUserId = 0,
    bool isVoid = false,
  }) async {
    return await initIsolate(
      clientId: clientId,
      clientOption: {
        ...client_option,
        ...clientOption,
      },
      clientUserId: clientUserId,
      isVoid: isVoid,
    );
  }

  // exit
  TdlibClient? getClientByUserId(int clientUserId) {
    List<MapEntry<int, TdlibClient>> entries = clients.entries.toList();
    for (var i = 0; i < entries.length; i++) {
      if (entries[i].value.client_user_id == clientUserId) {
        return entries[i].value;
      }
    }

    return null;
  }

  /// get all client id
  List<int> getAllClientIds() {
    return clients.entries.map((e) => e.key).toList();
    // return clients
    //     .map((e) {
    //       return e.client_id;
    //     })
    //     .toList()
    //     .cast<int>();
  }

  // exit
  TdlibClient? getClientById(int clientId) {
    return clients[clientId];
  }

  Future<bool> updateClientById(
    int clientId, {
    required TdlibClient newTdlibClient,
    String? extra,
    bool isInvokeThrowOnError = true,
  }) async {
    TdlibClient? tdlibClient = clients[clientId];
    if (tdlibClient != null) {
      // sendPort.send(newTdlibClient);

      clients[clientId] = newTdlibClient;
      return true;
    }
    return false;
  }

  Future<bool> exitClientById(
    int clientId, {
    bool isClose = false,
    String? extra,
    bool isInvokeThrowOnError = true,
  }) async {
    TdlibClient? tdlibClient = getClientById(clientId);
    if (tdlibClient != null) {
      if (isClose) {
        try {
          await invoke(
            "close",
            clientId: clientId,
            extra: extra,
            isUseCache: false,
            durationCacheExpire: null,
            isVoid: true,
            isInvokeThrowOnError: isInvokeThrowOnError,
          );
        } catch (e) {}
      }

      // sendPort.send(TdlibClientExit(client_id: clientId));
      return (clients.remove(clientId) != null);
    }
    return false;
  }

  /// ahis for handle update api
  /// add this for handle update api
  ///
  bool existClientId(int clientId) {
    return (clients[clientId] != null);
  }

  /// receive all update data
  Listener on(
      String type_update, FutureOr<dynamic> Function(UpdateTd update) callback,
      {void Function(Object data)? onError}) {
    return event_emitter.on(type_update, null, (Event ev, context) async {
      try {
        if (ev.eventData is TdlibIsolateReceiveData) {
          TdlibIsolateReceiveData tdlibIsolateReceiveData =
              (ev.eventData as TdlibIsolateReceiveData);
          await callback(UpdateTd(
            update: tdlibIsolateReceiveData.updateData,
            client_id: tdlibIsolateReceiveData.clientId,
            client_option: () {
              try {
                TdlibClient? tdlibClient =
                    clients[tdlibIsolateReceiveData.clientId];
                if (tdlibClient != null) {
                  return tdlibClient.client_option;
                }
              } catch (e) {}
              return {};
            }(),
          ));
          return;
        }
      } catch (e) {
        if (onError != null) {
          return onError(e);
        }
      }
    });
  }

  /// call api latest [Tdlib-Methods](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html)
  /// example:
  /// ```dart
  /// tg.invoke(
  ///  "getChat",
  ///  parameters: {
  ///    "chat_id": 0,
  ///  },
  ///  clientId: tg.client_id,
  /// );
  /// ```
  Future<Map> invoke(
    String method, {
    Map? parameters,
    int? clientId,
    bool isVoid = false,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    bool? isUseCache = false,
    Duration? durationCacheExpire,
    String? extra,
    bool? isAutoGetChat,
    bool? isInvokeThrowOnError,
    FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
        onGenerateExtraInvoke,
    FutureOr<Map> Function(String extra, int client_id, LibTdJson libTdJson)?
        onGetInvokeData,
  }) async {
    isUseCache ??= false;
    durationCacheExpire ??= Duration(
      minutes: 1,
    );
    isInvokeThrowOnError ??= is_invoke_throw_on_error;
    onGetInvokeData ??= on_get_invoke_data;
    onGenerateExtraInvoke ??= on_generate_extra_invoke;
    isAutoGetChat ??= is_auto_get_chat;
    clientId ??= client_id;
    invokeTimeOut ??= invoke_time_out;
    parameters ??= {};
    if (clientId == 0) {
      clientId = client_id;
    }

    String extra_id = "";

    bool is_set_extra_from_function = false;
    if (parameters["@extra"] is String == false) {
      if (extra != null) {
        extra_id = extra;
      } else if (onGenerateExtraInvoke != null) {
        extra_id = (await onGenerateExtraInvoke(clientId, this));
        is_set_extra_from_function = true;
      } else {
        extra_id = generateUuid(15);
      }
      parameters["@extra"] = extra_id;
    } else {
      extra_id = parameters["@extra"];
    }

    if (extra_id.isEmpty) {
      if (is_set_extra_from_function == false) {
        if (onGenerateExtraInvoke != null) {
          extra_id = (await onGenerateExtraInvoke(clientId, this));
        }
      }
    }
    if (extra_id.isEmpty) {
      extra_id = generateUuid(15);
      parameters["@extra"] = extra_id;
    }

    if (isAutoGetChat &&
        RegExp(r"^(sendMessage|getChatMember)$", caseSensitive: false)
            .hashData(method)) {
      if (parameters["chat_id"] is int) {
        td_send(
          clientId,
          {
            "@type": "getChat",
            "chat_id": parameters["chat_id"],
          },
        );
      }
      if (parameters["user_id"] is int) {
        td_send(
          clientId,
          {
            "@type": "getUser",
            "user_id": parameters["user_id"],
          },
        );
      }
    }

    TdlibClient? tdlib_client_procces = clients[clientId];
    bool is_has_get_cache_found = false;
    var (String key_cache, bool is_can_get_cache) =
        TdlibClientCache.createKeyAndCanGetCache(
            methodName: method, parameter: parameters);
    if (is_can_get_cache) {
      if (isUseCache) {
        if (tdlib_client_procces != null) {
          TdlibClientCacheData? tdlibClientCacheData =
              tdlib_client_procces.tdlibClientCache.getCacheByMethod(
            methodName: method,
            parameter: parameters,
          );
          is_has_get_cache_found = true;
          if (tdlibClientCacheData != null &&
              tdlibClientCacheData.result.isNotEmpty) {
            Map result_data = {...tdlibClientCacheData.result};
            result_data.addAll({
              "@extra": extra,
              "@client_id": clientId,
            });
            return result_data;
          }
        }
      }
    }

    Map requestMethod = {
      "@type": method,
      "client_id": clientId,
      ...parameters,
    };

    if (isVoid) {
      td_send(
        clientId,
        requestMethod,
      );
      return {
        "@type": "ok",
        "@extra": extra,
      };
    }
    Map result = {};
    Duration timeOut = invokeTimeOut;
    DateTime time_expire = DateTime.now().add(timeOut);
    if (onGetInvokeData != null) {
      td_send(
        clientId,
        requestMethod,
      );
      return await onGetInvokeData(extra_id, clientId, this);
    }

    if (isUseCache) {
      if (tdlib_client_procces != null) {
        TdlibClientCacheData? tdlibClientCacheData =
            tdlib_client_procces.tdlibClientCache.getCacheByMethod(
          methodName: method,
          parameter: parameters,
        );
        if (tdlibClientCacheData != null &&
            tdlibClientCacheData.result.isNotEmpty &&
            is_has_get_cache_found == false) {
          Map result_data = {...tdlibClientCacheData.result};
          result_data.addAll({
            "@extra": extra,
            "@client_id": clientId,
          });
          return result_data;
        }
      }
    }

    Listener listener = on(event_invoke, (UpdateTd update) async {
      try {
        if (update.client_id == clientId) {
          Map updateOrigin = update.raw;
          if (updateOrigin["@extra"] == extra_id) {
            updateOrigin.remove("@extra");
            updateOrigin.remove("@client_id");
            result = updateOrigin;
          }
        }
      } catch (e) {
        result["@type"] = "error";
      }
    });
    td_send(
      clientId,
      requestMethod,
    );
    task_increase();
    while (true) {
      await Future.delayed(delayDuration ?? delay_invoke);
      if (result["@type"] is String) {
        task_decrease();
        event_emitter.off(listener);
        if (result["@type"] == "error") {
          if (!isInvokeThrowOnError) {
            return result;
          }

          result["invoke_request"] = requestMethod;
          throw result;
        }

        if (isUseCache) {
          if (tdlib_client_procces != null) {
            tdlib_client_procces.tdlibClientCache.addCacheByMethod(
              methodName: method,
              parameter: parameters,
              result: result,
              durationExpired: durationCacheExpire,
            );
          }
        }

        return result;
      }
      if (time_expire.isBefore(DateTime.now())) {
        task_decrease();
        event_emitter.off(listener);

        result = {
          "@type": "error",
          "message": "time_out_limit",
          "invoke_request": requestMethod,
        };

        if (!isInvokeThrowOnError) {
          return result;
        }

        throw result;
      }
    }
  }

  Future<Map> request(
    String method, {
    Map? parameters,
    int? clientId,
    bool isVoid = false,
    Duration? delayDuration,
    Duration? invokeTimeOut,
    String? extra,
    bool? isUseCache,
    Duration? durationCacheExpire,
    bool? isAutoGetChat,
    FutureOr<String> Function(int client_id, LibTdJson libTdJson)?
        onGenerateExtraInvoke,
    FutureOr<Map> Function(String extra, int client_id, LibTdJson libTdJson)?
        onGetInvokeData,
    bool? isInvokeThrowOnError,
  }) async {
    return await invoke(
      method,
      parameters: parameters,
      clientId: clientId,
      isVoid: isVoid,
      isUseCache: isUseCache,
      durationCacheExpire: durationCacheExpire,
      delayDuration: delayDuration,
      invokeTimeOut: invokeTimeOut,
      extra: extra,
      isAutoGetChat: isAutoGetChat,
      onGenerateExtraInvoke: onGenerateExtraInvoke,
      onGetInvokeData: onGetInvokeData,
      isInvokeThrowOnError: isInvokeThrowOnError,
    );
  }

  /// call api latest [Tdlib-Methods](https://core.telegram.org/tdlib/docs/classtd_1_1td__api_1_1_function.html)
  /// example:
  /// ```dart
  /// tg.invokeSync(
  ///  "parseTextEntities",
  ///  parameters: {
  ///    "parse_mode": {
  ///      "@type": "textParseModeHTML",
  ///     },
  ///    "text": text
  ///   },
  ///   clientId: tg.client_id,
  /// );
  /// ```
  Map invokeSync(
    String method, {
    Map? parameters,
    int? clientId,
    bool isThrowOnError = true,
  }) {
    clientId ??= client_id;
    parameters ??= {};
    if (clientId == 0) {
      clientId = client_id;
    }

    String random = generateUuid(15);
    if (parameters is Map) {
      parameters["@extra"] = random;
    } else {
      parameters["@extra"] = random;
    }

    var requestMethod = {
      "@type": method,
      "client_id": clientId,
      ...parameters,
    };

    Map result = td_json_client_execute(clientId, requestMethod);
    if (result["@type"] == "error") {
      if (!isThrowOnError) {
        return result;
      }
      result["invoke_request"] = requestMethod;
      throw result;
    }
    return result;
  }
}
