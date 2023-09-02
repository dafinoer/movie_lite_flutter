import 'package:flutter/cupertino.dart';

class ValidationApiKey extends ChangeNotifier {
  String? _textApiKey;
  bool _isInvalidForm = false;

  String? get textApiKey => _textApiKey;

  bool get isInvalidForm => _isInvalidForm;

  void validate() {
    _isInvalidForm = _validateText;
    notifyListeners();
  }

  bool get _validateText => _textApiKey?.isEmpty ?? false;

  set onChangeText(String value) {
    _textApiKey = value;
  }
}
