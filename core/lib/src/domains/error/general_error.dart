class GeneralError implements Exception {
  final String? message;

  const GeneralError({this.message});

  @override
  String toString() {
    final msgResult = message;
    if (msgResult != null) return msgResult;

    return 'General Error Exception';
  }
}
