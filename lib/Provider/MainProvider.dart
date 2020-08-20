

import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  String _value = "안녕하세요";

  String get value => _value;
  set value(String newValue) {
    _value = newValue;
    notifyListeners();
  }
} // 노티파이어 -> 프로바이더