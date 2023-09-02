
import 'package:dio/dio.dart';

import '../../../datastore/api_token_datastore.dart';

class ApiTokenInterceptor extends Interceptor {
  final ApiTokenDataStore apiTokenDataStore;

  ApiTokenInterceptor(this.apiTokenDataStore);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final apiToken = apiTokenDataStore.getToken();
    if (apiToken != null) {
      options.headers.update(
        'Authorization',
        (value) => value,
        ifAbsent: () => 'Bearer $apiToken',
      );
    }
    super.onRequest(options, handler);
  }
}
