import 'package:flutter/material.dart';

class ClinicProvider with ChangeNotifier {
  String currentUserId;
  changeCurrentUserId(String _userId) {
    currentUserId = _userId;
    notifyListeners();
  }
}
