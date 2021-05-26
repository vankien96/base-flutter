import 'dart:convert';
import 'package:base/commons/const/hive_key.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class AppLocalStore {
  late final Box settingBox;
  late final FlutterSecureStorage secureStorage;
  late final Box secureBox;

  AppLocalStore();

  Future init() async {
    settingBox = await Hive.openBox(HiveKey.settingBox);
    secureStorage = const FlutterSecureStorage();
    await _initSecureBox();
  }

  Future<void> _initSecureBox() async {
    var containsEncryptionKey =
        await secureStorage.containsKey(key: HiveKey.hiveKey);
    if (!containsEncryptionKey) {
      var key = Hive.generateSecureKey();
      await secureStorage.write(
          key: HiveKey.hiveKey, value: base64UrlEncode(key));
    }
    var encryptionKey =
        base64Url.decode(await secureStorage.read(key: HiveKey.hiveKey) ?? "");
    secureBox = await Hive.openBox(HiveKey.secureBox,
        encryptionCipher: HiveAesCipher(encryptionKey));
  }
}
