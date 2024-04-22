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
// ignore_for_file: non_constant_identifier_names, unused_import
import "package:general_lib/general_lib.dart";
// import "dart:convert";

class TgClientClientData extends JsonScheme {
  TgClientClientData(super.rawData);

  static Map get defaultData {
    return {
      "@type": "tgClientClientData",
      "id": 0,
      "created_at": "2022-12-26T05:26:40.500935+00:00",
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
    };
  }

  String? get special_type {
    try {
      if (rawData["@type"] is String == false) {
        return null;
      }
      return rawData["@type"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get id {
    try {
      if (rawData["id"] is num == false) {
        return null;
      }
      return rawData["id"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get created_at {
    try {
      if (rawData["created_at"] is String == false) {
        return null;
      }
      return rawData["created_at"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get client_user_id {
    try {
      if (rawData["client_user_id"] is num == false) {
        return null;
      }
      return rawData["client_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get client_title {
    try {
      if (rawData["client_title"] is String == false) {
        return null;
      }
      return rawData["client_title"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get client_token {
    try {
      if (rawData["client_token"] is String == false) {
        return null;
      }
      return rawData["client_token"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get owner_user_id {
    try {
      if (rawData["owner_user_id"] is num == false) {
        return null;
      }
      return rawData["owner_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get client_type {
    try {
      if (rawData["client_type"] is String == false) {
        return null;
      }
      return rawData["client_type"] as String;
    } catch (e) {
      return null;
    }
  }

  Object? get from_bot_type {
    try {
      if (rawData["from_bot_type"] is Object == false) {
        return null;
      }
      return rawData["from_bot_type"] as Object;
    } catch (e) {
      return null;
    }
  }

  bool? get can_join_groups {
    try {
      if (rawData["can_join_groups"] is bool == false) {
        return null;
      }
      return rawData["can_join_groups"] as bool;
    } catch (e) {
      return null;
    }
  }

  bool? get can_read_all_group_messages {
    try {
      if (rawData["can_read_all_group_messages"] is bool == false) {
        return null;
      }
      return rawData["can_read_all_group_messages"] as bool;
    } catch (e) {
      return null;
    }
  }

  num? get from_bot_user_id {
    try {
      if (rawData["from_bot_user_id"] is num == false) {
        return null;
      }
      return rawData["from_bot_user_id"] as num;
    } catch (e) {
      return null;
    }
  }

  num? get expire_date {
    try {
      if (rawData["expire_date"] is num == false) {
        return null;
      }
      return rawData["expire_date"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get client_username {
    try {
      if (rawData["client_username"] is String == false) {
        return null;
      }
      return rawData["client_username"] as String;
    } catch (e) {
      return null;
    }
  }

  String? get version {
    try {
      if (rawData["version"] is String == false) {
        return null;
      }
      return rawData["version"] as String;
    } catch (e) {
      return null;
    }
  }

  num? get client_id {
    try {
      if (rawData["client_id"] is num == false) {
        return null;
      }
      return rawData["client_id"] as num;
    } catch (e) {
      return null;
    }
  }

  String? get client_data {
    try {
      if (rawData["client_data"] is String == false) {
        return null;
      }
      return rawData["client_data"] as String;
    } catch (e) {
      return null;
    }
  }

  static TgClientClientData create({
    String special_type = "tgClientClientData",
    num? id,
    String? created_at,
    num? client_user_id,
    String? client_title,
    String? client_token,
    num? owner_user_id,
    String? client_type,
    Object? from_bot_type,
    bool? can_join_groups,
    bool? can_read_all_group_messages,
    num? from_bot_user_id,
    num? expire_date,
    String? client_username,
    String? version,
    num? client_id,
    String? client_data,
  }) {
    // TgClientClientData tgClientClientData = TgClientClientData({
    Map tgClientClientData_data_create_json = {
      "@type": special_type,
      "id": id,
      "created_at": created_at,
      "client_user_id": client_user_id,
      "client_title": client_title,
      "client_token": client_token,
      "owner_user_id": owner_user_id,
      "client_type": client_type,
      "from_bot_type": from_bot_type,
      "can_join_groups": can_join_groups,
      "can_read_all_group_messages": can_read_all_group_messages,
      "from_bot_user_id": from_bot_user_id,
      "expire_date": expire_date,
      "client_username": client_username,
      "version": version,
      "client_id": client_id,
      "client_data": client_data,
    };

    tgClientClientData_data_create_json
        .removeWhere((key, value) => value == null);
    TgClientClientData tgClientClientData_data_create =
        TgClientClientData(tgClientClientData_data_create_json);

    return tgClientClientData_data_create;
  }
}
