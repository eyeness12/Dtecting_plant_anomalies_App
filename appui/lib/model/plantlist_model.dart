import 'package:appui/data/plantinfo.dart';
import 'package:flutter/material.dart';
import '../data/model.dart';

class PlantListModel extends ChangeNotifier {
  late List<Plantinfo> _list = [];
  late String _plant;
  late String _description = allList[0].description;

  List<Plantinfo> get list => _list;

  String get description => _description;

  String get plant => _plant;

  set plant(String plant) {
    _plant = plant;
    notifyListeners();
  }


  set description(String chaine) {
    _description = chaine;
    notifyListeners();
  }

  set list(List<Plantinfo> info) {
    _list = info;
    notifyListeners();
  }
}
