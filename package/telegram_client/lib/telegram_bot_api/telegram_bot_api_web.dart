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
// // ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions slash_for_doc_comments, empty_catches, unnecessary_brace_in_string_interps, unused_local_variable

// // ignore: slash_for_doc_comments
// //
// import 'dart:async' show Future;

// // import 'package:alfred/alfred.dart';
// import 'package:general_lib/general_lib.dart';
// import 'package:http/http.dart';
// import 'dart:convert' as convert;

// /// Telegram Bot Api library:
// /// example:
// /// ```dart
// /// TelegramBotApiWeb tg = TelegramBotApiWeb("token_bot");
// /// tg.request("sendMessage",  parameters: {
// ///   "chat_id": 12345,
// ///   "text": "Hello world"
// /// });
// /// ````
// ///
// class TelegramBotApiWeb {
//   late String token_bot;
//   Client http_client = Client();
//   Map client_option = {
//     "api_id": 0,
//     "api_hash": "",
//     "botPath": "/bot/",
//     "userPath": "/user/",
//     "port": 8080,
//     "type": "bot",
//     "logger": false,
//     "api": "https://api.telegram.org/",
//     "allowed_updates": [
//       "message",
//       "edited_message",
//       "channel_post",
//       "edited_channel_post",
//       "inline_query",
//       "chosen_inline_result",
//       "callback_query",
//       "shipping_query",
//       "pre_checkout_query",
//       "poll",
//       "poll_answer",
//       "my_chat_member",
//       "chat_member",
//       "chat_join_request",
//     ],
//   };
//   List state_data = [];
//   String event_invoke = "invoke";
//   String event_update = "update";

//   /// list methods:
//   /// api:
//   /// ```dart
//   /// tg.request("getMe");
//   /// ```
//   ///
//   TelegramBotApiWeb({
//     required String tokenBot,
//     Map? clientOption,
//     String telegramCryptoKey = "aeatmlvodkm9ii37l2p0WGkaAAF3BWCh",
//     this.event_invoke = "invoke",
//     this.event_update = "update",
//     Uri? telegramUrlWebhook,
//     Client? httpClient,
//   }) {
//     if (httpClient != null) {
//       http_client = httpClient;
//     }

//     token_bot = tokenBot;
//     if (clientOption != null) {
//       client_option.addAll(clientOption);
//     }
//   }

//   Map typeFile(dynamic content) {
//     Map data = {};
//     if (content is String) {
//       if (RegExp(r"^http", caseSensitive: false).hashData(content)) {
//         data = {"@type": 'inputFileRemote', "data": content};
//       }
//       if (content is int) {
//         data = {"@type": 'inputFileId', "data": content};
//       } else {
//         data = {"@type": 'inputFileRemote', "data": content};
//       }
//     } else {
//       data = {"@type": 'inputFileRemote', "data": content};
//     }
//     return data;
//   }

//   /// call api latest [bot api](https://core.telegram.org/bots/api#available-methods)
//   /// example:
//   /// ```dart
//   /// invoke("sendMessage", parameters: {
//   ///   "chat_id": 123456,
//   ///   "text": "<b>Hello</b> <code>word</code>",
//   ///   "parse_mode": "html"
//   /// });
//   /// ```
//   Future<Map> invoke(
//     String method, {
//     Map? parameters,
//     bool is_form = false,
//     String? tokenBot,
//     String? urlApi,
//     String? clientType,
//     bool isThrowOnError = true,
//     void Function(int bytesCount, int totalBytes)? onUploadProgress,
//     Client? httpClient,
//   }) async {
//     httpClient ??= http_client;
//     parameters ??= {};
//     clientType ??= client_option["type"];
//     urlApi ??= client_option["api"];
//     tokenBot ??= token_bot;
//     var option = {
//       "method": "post",
//     };

//     var url = Uri.parse((urlApi ?? "")).replace(pathSegments: [
//       (clientType ?? "bot") + tokenBot,
//       method,
//     ]).toString();
//     if (!is_form) {
//       List<String> methodForm = [
//         "sendDocument",
//         "sendPhoto",
//         "sendAudio",
//         "sendVideo",
//         "sendVoice",
//         "setChatPhoto",
//         "sendVideoNote",
//         "sendAnimation",
//         "sendMediaGroup",
//       ];
//       List<String> keyForm = [
//         "video",
//         "audio",
//         "voice",
//         "document",
//         "photo",
//         "animation",
//         "video_note",
//         "media",
//       ];

//       if (methodForm
//           .map((e) => e.toLowerCase())
//           .toList()
//           .contains(method.toLowerCase())) {
//         //   parameters.forEach((key, value) {
//         //     if (parameters == null) {
//         //       return;
//         //     }
//         //     try {
//         //       if (keyForm.contains(key)) {
//         //         if (key == "media") {
//         //           if (value is List) {
//         //             for (var i = 0; i < value.length; i++) {
//         //               Map value_data = value[i];
//         //               value_data.forEach((key_loop, value_loop) {
//         //                 if (key_loop == "media") {
//         //                   if (value_loop is File) {
//         //                     value[i][key_loop] = value_loop.uri.toString();
//         //                   } else {
//         //                     try {
//         //                       value[i][key_loop] = typeFile(value_loop)["data"];
//         //                       if (value[i][key_loop] is String == false) {
//         //                         is_form = true;
//         //                       }
//         //                     } catch (e) {}
//         //                   }
//         //                 }
//         //               });
//         //             }
//         //           }
//         //         } else if (value is File) {
//         //           parameters[key] = value.uri.toString();
//         //         } else {
//         //           parameters[key] = typeFile(value)["data"];
//         //           if (parameters[key] is String == false) {
//         //             is_form = true;
//         //           }
//         //         }
//         //       }
//         //     } catch (e) {}
//         //   });
//         // }
//       }
//     }
//     try {
//       // if (is_form) {
//       //   HttpClient httpClientForm = HttpClient();
//       //   final request = await httpClientForm.postUrl(Uri.parse(url));
//       //   var form = MultipartRequest("post", Uri.parse(url));

//       //   parameters.forEach((key, value) async {
//       //     if (value is File) {
//       //       form.fields[key] = value.uri.toString();
//       //     } else if (value is Map) {
//       //       if (value["is_post_file"] == true) {
//       //         var files = await MultipartFile.fromPath(key, value["file_path"]);
//       //         form.files.add(files);
//       //       } else if (value["is_post_buffer"] == true) {
//       //         var files = MultipartFile.fromBytes(key, value["buffer"], filename: value["name"], contentType: value["content_type"]);
//       //         form.files.add(files);
//       //       } else {
//       //         form.fields[key] = convert.json.encode(value);
//       //       }
//       //     } else if (value is String) {
//       //       form.fields[key] = value;
//       //     } else if (key == "media" && value is List<Map>) {
//       //       List<Map> values = [];
//       //       for (var i = 0; i < value.length; i++) {
//       //         Map value_data = value[i];
//       //         Map jsonData = {};
//       //         value_data.forEach((key_loop, value_loop) {
//       //           if (key_loop == "media" && value_loop is Map) {
//       //             if (value_loop["is_post_buffer"] == true) {
//       //               String name_file = "file_${i}_${value_loop["name"]}";
//       //               var files = MultipartFile.fromBytes(
//       //                 name_file,
//       //                 value_loop["buffer"],
//       //                 filename: value_loop["name"],
//       //                 contentType: value_loop["content_type"],
//       //               );
//       //               form.files.add(files);
//       //               jsonData[key_loop] = "attach://${name_file}";
//       //             } else {
//       //               jsonData[key_loop] = value_loop.toString();
//       //             }
//       //           } else if (value_loop is File) {
//       //             jsonData[key_loop] = value_loop.uri.toString();
//       //           } else {
//       //             jsonData[key_loop] = value_loop.toString();
//       //           }
//       //         });
//       //         values.add(jsonData);
//       //       }
//       //       form.fields[key] = convert.json.encode(values);
//       //     } else {
//       //       form.fields[key] = value.toString();
//       //     }
//       //   });

//       //   var msStream = form.finalize();
//       //   var totalByteLength = form.contentLength;
//       //   request.contentLength = totalByteLength;
//       //   request.headers.set(
//       //     HttpHeaders.contentTypeHeader,
//       //     form.headers[HttpHeaders.contentTypeHeader]!,
//       //   );
//       //   int byteCount = 0;
//       //   Stream<List<int>> streamUpload = msStream.transform(
//       //     StreamTransformer.fromHandlers(
//       //       handleData: (data, sink) {
//       //         sink.add(data);
//       //         byteCount += data.length;
//       //         if (onUploadProgress != null) {
//       //           onUploadProgress(byteCount, totalByteLength);
//       //         }
//       //       },
//       //       handleError: (error, stack, sink) {
//       //         throw error;
//       //       },
//       //       handleDone: (sink) {
//       //         sink.close();
//       //       },
//       //     ),
//       //   );
//       //   await request.addStream(streamUpload);
//       //   final httpResponse = await request.close();
//       //   var statusCode = httpResponse.statusCode;
//       //   var completer = Completer<String>();
//       //   var contents = StringBuffer();
//       //   httpResponse.transform(convert.utf8.decoder).listen((String data) {
//       //     contents.write(data);
//       //   }, onDone: () => completer.complete(contents.toString()));
//       //   var body = convert.json.decode(await completer.future);
//       //   if (statusCode == 200) {
//       //     return body;
//       //   } else {
//       //     if (isThrowOnError) {
//       //       throw body;
//       //     } else {
//       //       return body;
//       //     }
//       //   }
//       // } else {
//       option["body"] = convert.json.encode(parameters);
//       var response = await httpClient.post(
//         Uri.parse(url),
//         headers: {
//           'Accept': 'application/json',
//           "Access-Control-Allow-Origin": "*",
//           "Content-Type": "application/json",
//         },
//         body: option["body"],
//       );
//       if (response.statusCode == 200) {
//         if (method.toString().toLowerCase() == "getfile") {
//           var getFile = convert.json.decode(response.body);
//           var url = "${urlApi}file/$clientType${tokenBot.toString()}";
//           getFile["result"]["file_url"] =
//               "$url/${getFile["result"]["file_path"]}";
//           return getFile;
//         } else {
//           return convert.json.decode(response.body);
//         }
//       } else {
//         var json = convert.json.decode(response.body);
//         if (isThrowOnError) {
//           throw json;
//         } else {
//           return json;
//         }
//       }
//       // }
//     } catch (e) {
//       if (RegExp(r"^(send)", caseSensitive: false).hasMatch(method)) {
//         if (e is Map) {
//           if (RegExp("Unsupported start tag", caseSensitive: false)
//               .hasMatch(e["description"])) {
//             parameters.remove("parse_mode");
//             return await invoke(
//               method,
//               parameters: parameters,
//               is_form: is_form,
//               isThrowOnError: isThrowOnError,
//               tokenBot: tokenBot,
//               urlApi: urlApi,
//               clientType: clientType,
//               onUploadProgress: onUploadProgress,
//             );
//             // Bad Request: can't parse entities: Unsupported start tag "spoir" at byte offset 79
//           }
//         }
//         rethrow;
//       } else {
//         rethrow;
//       }
//     }
//   }

//   /// example:
//   /// ```dart
//   /// tg.file("./doc.json"),
//   /// ```
//   Map file(path, [Map<String, dynamic> option = const <String, dynamic>{}]) {
//     Map<String, dynamic> jsonData = {
//       "is_post_file": true,
//     };
//     if (RegExp(r"^(./|/)", caseSensitive: false).hashData(path)) {
//       var filename = path
//           .toString()
//           .replaceAll(RegExp(r"^(./|/)", caseSensitive: false), "");
//       jsonData["file_name"] = filename;
//       jsonData["file_path"] = path;
//       jsonData.addAll(option);
//     } else {
//       jsonData["is_post_file"] = false;
//       jsonData["file_path"] = path;
//     }
//     return jsonData;
//   }

//   Map buffer(List<int> data, {String? name}) {
//     Map jsonData = {
//       "is_post_buffer": true,
//     };
//     jsonData["buffer"] = data;
//     jsonData["name"] = name;
//     return jsonData;
//   }
// }
