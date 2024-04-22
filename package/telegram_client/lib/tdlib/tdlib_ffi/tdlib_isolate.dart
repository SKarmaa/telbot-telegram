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
// ignore_for_file: non_constant_identifier_names, camel_case_extensions, camel_case_extensions empty_catches

// import 'dart:io';

// import 'package:telegram_client/isolate/isolate.dart';
// import 'package:telegram_client/scheme/tdlib_client.dart';
import 'package:telegram_client/tdlib/tdlib.dart';
import 'package:telegram_client/tdlib/tdlib_ffi/tdlib_io.dart';

/// add this for multithread new client on flutter apps
Future<void> tdlibIsolate(TdlibIsolateData tdlibIsolateData) async {
  try {
    Duration duration =
        tdlibIsolateData.delayUpdate ?? Duration(microseconds: 1);
    while (true) {
      await Future.delayed(duration);
      Map? new_update = LibTdJson.td_receive_static(
        timeout: tdlibIsolateData.timeOutUpdate,
        path_tdlib: tdlibIsolateData.pathTdlib,
      );
      if (new_update != null) {
        tdlibIsolateData.sendPort.send(
          TdlibIsolateReceiveData(
            updateData: new_update,
            clientId: new_update["@client_id"],
          ),
        );
        //
      }
    }
  } catch (e) {
    tdlibIsolateData.sendPort.send(
      TdlibIsolateReceiveDataError(),
    );
  }
}
