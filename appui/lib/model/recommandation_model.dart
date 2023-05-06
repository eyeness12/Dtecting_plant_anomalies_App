import 'package:flutter/material.dart';
import '../data/anomalies.dart';
import '../data/treatment.dart';

class RecommendationModel extends ChangeNotifier {
  String? _selectedOption1;
  String? _selectedOption2;
  String? _selectedOption3;

  bool _text1 = false;
  bool _text2 = false;
  bool _text3 = false;
  bool _test = false;
  bool _coloryellow = false;
  late int _x;

  String? get selectedOption1 => _selectedOption1;
  String? get selectedOption2 => _selectedOption2;
  String? get selectedOption3 => _selectedOption3;
  bool get text1 => _text1;
  bool get text2 => _text2;
  bool get text3 => _text3;
  bool get test => _test;
  bool get coloryellow => _coloryellow;
  int get x => _x;

  void setText1(bool text) {
    this._text1 = text;
    notifyListeners();
  }

  void setText2(bool text) {
    this._text2 = text;
    notifyListeners();
  }

  void setText3(bool text) {
    this._text3 = text;
    notifyListeners();
  }

  void setTest(bool test) {
    this._test = test;
    notifyListeners();
  }

  void settColor(bool color) {
    this._coloryellow = color;
    notifyListeners();
  }

  void setx(int x) {
    this._x = x;
    notifyListeners();
  }

  void setOption1(String? selectedOption) {
    _selectedOption1 = selectedOption;
    notifyListeners();
  }

  void setOption2(String? selectedOption) {
    _selectedOption2 = selectedOption;
    notifyListeners();
  }

  void setOption3(String? selectedOption) {
    _selectedOption3 = selectedOption;
    notifyListeners();
  }

  String getRecommandation(int i) {
    if (i != 3) {
      if (selectedOption1 != "Yellow") {
        return recinfo[i].options[0][selectedOption1] +
            recinfo[i].options[1][selectedOption2][x] +
            recinfo[i].options[2][selectedOption3];
      } else {
        return recinfo[i].options[0][selectedOption1];
      }
    }
    return "Provide adequate air circulation around plants \n Remove and dispose of infected plant material promptly to prevent the disease from spreading.\n Fungicides can be used to control powdery mildew mildew, but they are most effective when used preventively.\n Some effective fungicides for powdery mildew include sulfur, potassium bicarbonate, and neem oil.	";
  }
}
