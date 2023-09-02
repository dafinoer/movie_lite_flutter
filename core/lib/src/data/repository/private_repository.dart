


import 'dart:async';

abstract class PrivateRepository {
  FutureOr<String?> getApiToken();
  Future<void> onWriteApiToken(String value);
}