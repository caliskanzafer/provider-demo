import 'package:flutter/material.dart';

class BottomNavigationBarState with ChangeNotifier {
  int _currentIndex = 0;
  get currentIndex => _currentIndex;

  onTapped(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
