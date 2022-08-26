import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(Uri.parse('https://swapi.dev/api/people/1/'));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Error: It could be your Internet connection?';
      _map = {};
    }
    notifyListeners();
  }

  void initialValue() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}
