import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageHelper {
  final secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
}
