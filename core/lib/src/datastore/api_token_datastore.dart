import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '_constanta_keys.dart';

@lazySingleton
class ApiTokenDataStore {
  final Box<String> _box;

  ApiTokenDataStore(@Named(securityBox) this._box);

  Future<void> writeToken(String value) => _box.put(apiKeyTokenKey, value);

  String? getToken() => _box.get(apiKeyTokenKey);
}
