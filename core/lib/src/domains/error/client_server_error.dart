class ClientServerError implements Exception {
  final String? message;
  final int? statusCode;

  ClientServerError({this.message, this.statusCode});

  @override
  String toString() {
    if (message != null && statusCode != null) {
      return 'Client Error: $statusCode = $message';
    } else if (statusCode != null) {
      return 'Client Error: $statusCode';
    }
    return 'Client Error';
  }
}
