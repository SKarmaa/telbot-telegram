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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches, empty_catches

import 'package:general_lib/general_lib.dart';
import 'package:telegram_client/telegram_login_widget/scheme/user_telegram_login_widget.dart';
import 'package:telegram_client/telegram_login_widget/telegram_login_widget.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  TelegramLogin telegramLogin = TelegramLogin(botId: "", botDomain: "");
  File file = File("./cookie.txt");
  if (file.existsSync() == false) {
    await file.create(recursive: true);
  }
  String cookies = await () async {
    try {
      return await file.readAsString();
    } catch (e) {}
    return "";
  }();
  telegramLogin.session.cookies = cookies;
  // print(telegramLogin.session.cookies);
  bool is_send_code = await telegramLogin.loginTelegram(phoneNumber: "");
  print(is_send_code);
  while (true) {
    await Future.delayed(Duration(milliseconds: 10));
    bool check_is_login = await telegramLogin.checkIsLogin();
    print(check_is_login);
    if (check_is_login) {
      break;
    }
  }
  while (true) {
    await Future.delayed(Duration(milliseconds: 10));
    bool is_login = await telegramLogin.confirmLogin();
    if (is_login) {
      break;
    }
    print(is_login);
  }
  //
  UserTelegramLoginWidget getMe = await telegramLogin.getMe();
  getMe.toJson().printPretty(2);
  await file.writeAsString(telegramLogin.session.cookies);

  exit(0);
}
