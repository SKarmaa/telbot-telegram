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
import 'package:general_lib/general_lib.dart';
import 'package:path/path.dart';
import 'package:universal_io/io.dart';

void main(List<String> args) async {
  List<Map> datas = [
    {
      "@type": "tgClientClientData",

      "id": 0,
      "created_at": "2022-12-26T05:26:40.500935+00:00",
      // "group": [],
      // "private": [],
      "client_user_id": 0,
      "client_title": "",
      "client_token": "",
      "owner_user_id": 0,
      "client_type": "",
      "from_bot_type": null,
      "can_join_groups": false,
      "can_read_all_group_messages": false,
      "from_bot_user_id": 0,
      "expire_date": 0,
      "client_username": "",
      "version": "",
      "client_id": 0,

      "client_data": "{}"
      // "channel": [],
    }
  ];

  await jsonToScripts(
    datas,
    directory: Directory(
      join(Directory.current.path, "lib", "telegram_bot_api", "scheme"),
      // "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_bot_api/scheme",
    ),
  );
}
