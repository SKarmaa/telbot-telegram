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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions unused_local_variable, unused_local_variable

import 'dart:convert';
import 'package:telegram_client/alfred/alfred.dart';
import 'package:telegram_client/telegram_client.dart';

void main(List<String> args) async {
  Alfred alfred = Alfred(
    logLevel: LogType.error,
  );
  await alfred.listen();
  TelegramBotApiServer telegramBotApiServer = TelegramBotApiServer();
  await telegramBotApiServer.run(
    executable: "telegram-bot-api",
    arguments: telegramBotApiServer.optionsParameters(
      api_id: "telegram_api_id",
      api_hash: "telegram_api_hash",
    ),
    host: "0.0.0.0",
    tg_bot_api_port: 9000,
  );
  print(
      "Server on: http://${alfred.server!.address.host}:${alfred.server!.port}");
  String telegram_token_bot = "";
  Uri telegram_url_webhook = Uri.parse("https://0.0.0.0:3000/telegram/webhook");
  TelegramBotApi tg = TelegramBotApi(
    tokenBot: telegram_token_bot,
    alfred: alfred,
    clientOption: {"api": "http://0.0.0.0:9000"},
    telegramUrlWebhook: telegram_url_webhook,
  );
  tg.on(tg.event_update, (updateBot) async {
    try {
      Map update = updateBot.body;
      if (update["message"] is Map) {
        Map msg = update["message"];
        int form_id = msg["from"]["id"];
        int chat_id = msg["chat"]["id"];
        String caption_msg = () {
          if (msg["text"] is String) {
            return msg["text"];
          }
          if (msg["caption"] is String) {
            return msg["caption"];
          }

          return "";
        }();
        if (caption_msg.isNotEmpty) {
          if (RegExp(r"^/(start)", caseSensitive: false)
              .hasMatch(caption_msg)) {
            return await tg.request(
              "sendMessage",
              parameters: {
                "chat_id": chat_id,
                "text": "Hai saya adalah robot",
              },
              isAutoExtendMessage: true,
            );
          }
        }
        await tg.request(
          "sendMessage",
          parameters: {
            "chat_id": chat_id,
            "text": json.encode(msg),
          },
          isAutoExtendMessage: true,
        );
      }
    } catch (e) {
      print(e);
    }
  });
  Map client = await tg.initIsolate();
  print(client);
}
