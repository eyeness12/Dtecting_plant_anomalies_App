import 'package:flutter/material.dart';
import '../data/treatment.dart';
import '../model/recommandation_model.dart';

class RecommandationViewModel extends ChangeNotifier {
  late RecommendationModel _model;

  String? get selectedOption1 => _model.selectedOption1;
  String? get selectedOption2 => _model.selectedOption2;
  String? get selectedOption3 => _model.selectedOption3;
  bool get text1 => _model.text1;
  bool get text2 => _model.text2;
  bool get text3 => _model.text3;
  bool get test => _model.test;
  bool get coloryellow => _model.coloryellow;
  int get x => _model.x;

  RecommandationViewModel() {
    _model = RecommendationModel();
  }

  void modifyText1(bool text) {
    _model.setText1(text);
  }

  void modifyText2(bool text) {
    _model.setText2(text);
  }

  void modifyText3(bool text) {
    _model.setText3(text);
  }

  void modifyTest(bool test) {
    _model.setTest(test);
  }

  void modifyColor(bool color) {
    _model.settColor(color);
  }

  void modifyX(int a) {
    _model.setx(a);
  }

  void modifyOption1(String? selectedOption) {
    _model.setOption1(selectedOption);
  }

  void modifyOption2(String? selectedOption) {
    _model.setOption2(selectedOption);
  }

  void modifyOption3(String? selectedOption) {
    _model.setOption3(selectedOption);
  }

  String afficherRecommandation(int i) {
    return _model.getRecommandation(i);
  }
}
