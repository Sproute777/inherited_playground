import 'package:flutter/cupertino.dart';

class MyModel extends ChangeNotifier {
  int _value = 0;
  int get value => _value;

  void increment() {
    _value++;
    notifyListeners();
  }

  void inputValue(int number){
    _value = number;
    notifyListeners();
  }
}