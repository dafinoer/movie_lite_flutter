import 'dart:async';

import 'package:injectable/injectable.dart';


import '../../datastore/api_token_datastore.dart';
import 'private_repository.dart';

@Injectable(as: PrivateRepository)
class PrivateRepositoryImpl implements PrivateRepository {
  final ApiTokenDataStore apiTokenDataStore;

  PrivateRepositoryImpl(this.apiTokenDataStore);

  @override
  Future<void> onWriteApiToken(String value) =>
      apiTokenDataStore.writeToken(value);

  @override
  FutureOr<String?> getApiToken() => apiTokenDataStore.getToken();
}
