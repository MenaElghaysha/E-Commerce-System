import 'package:flutter/material.dart';

class SelectedCategoryProvider with ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  set selectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  int _selectedCat = 0;

  int get selectedCat => _selectedCat;

  set selectedCat(int index) {
    _selectedCat = index;
    notifyListeners();
  }
}
