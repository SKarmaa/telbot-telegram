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
// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:universal_io/io.dart';

void main(List<String> args) async {
  Directory directory_function = Directory(
      "/home/galaxeus/Documents/galaxeus/app/telegram_client/package/telegram_client/lib/telegram_client/function");
  List<FileSystemEntity> files = directory_function.listSync();
  print("Starrt");
  for (var i = 0; i < files.length; i++) {
    FileSystemEntity fileSystemEntity = files[i];
    if (fileSystemEntity is File) {
      List<String> data = (await fileSystemEntity.readAsString()).split("\n");

      bool is_not_found_data = true;
      // data.removeWhere((element) => element.trim() == "await invoke");
      for (var index = 0; index < data.length; index++) {
        String sub_data = data[index];
        if (index == 0) {
          continue;
        }
        if (sub_data.trim() == "await invoke") {
          is_not_found_data = false;

          data[index] = "await callApiInvoke";
          break;
        }
      }
      // if (is_not_found_data) {
      //   for (var index = 0; index < data.length; index++) {
      //     String sub_data = data[index];
      //     if (index == 0) {
      //       continue;
      //     }
      //     if (RegExp(r"import ", caseSensitive: false).hasMatch(sub_data)) {
      //       data.insert(index + 1, "import 'package:telegram_client/telegram_client/call_api_invoke.dart';");
      //       break;
      //     }
      //   }
      // }

      await fileSystemEntity.writeAsString(data.join("\n"));
      // print(fileSystemEntity.path);
      // exit(0);
    }
  }

  exit(0);
}
