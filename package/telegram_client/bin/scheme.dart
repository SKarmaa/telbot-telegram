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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions

import 'dart:io';

import 'package:general_lib/general_lib.dart';

void main(List<String> args) async {
  List<Map> scripts_origin = [
    {
      "@type": "userTelegramLoginWidget",
      "id": "6609944680",
      "first_name": "Gi",
      "username": "Hhhhhhhhhyhh",
      "hash":
          "b8e56bd623ce43fdb58f386eaec2c5ab320fe3fd3a561c51576f6e41208084fe",
    },
    // {
    //   "@type": "ok",
    // },
    // {
    //   "@type": "error",
    //   "code": 500,
    //   "message": "",
    //   "description": "",
    // },
    // {
    //   "@type": "chat",
    //   "id": 0,
    //   "first_name": "",
    //   "last_name": "",
    //   "username": "",
    // }
  ];
  for (var i = 0; i < scripts_origin.length; i++) {
    scripts_origin[i]["@extra"] = "";
  }
  await jsonToScripts(scripts_origin,
      directory: Directory(
          "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_login_widget/scheme"));
}
