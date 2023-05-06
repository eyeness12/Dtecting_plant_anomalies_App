import 'package:flutter/material.dart';
import '../data/model.dart';
import '../data/plantinfo.dart';
import '../model/plantlist_model.dart';
import '../view/plantdetail_view.dart';
import 'package:get/get.dart';

class PlantListViewModel extends ChangeNotifier {
  late ScrollController _scrollController;
  late PlantListModel _model;

  PlantListViewModel() {
    _model = PlantListModel();

    _scrollController = ScrollController();
    _scrollController.addListener(changeDescription);
  }

  changeDescription() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 235).round();
    _model.description = _model.list[descIndex].description;
    _model.plant = _model.list[descIndex].name;
    notifyListeners();
  }

  List<Plantinfo> listchanger(String ch) {
    if (ch == "All")
      _model.list = allList;
    else if (ch == "Plants")
      _model.list = plantList;
    else if (ch == "Anomalies") _model.list = anomaliesList;
    return _model.list;
  }

  List<Plantinfo> get list => _model.list;

  ScrollController get scrollController => _scrollController;

  String get description => _model.description;

  String get plant => _model.plant;

  getPlantCard(String imagePath, String plantType, String plantName, int i) {
    return Stack(children: <Widget>[
      Container(
          height: 325.0,
          width: 225.0,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF399D63),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 158, 158, 158),
                    blurRadius: 5,
                    offset: Offset(0, 4),
                  ),
                  BoxShadow(
                    color: Color.fromARGB(255, 158, 158, 158),
                    blurRadius: 8,
                    offset: Offset(-4, 0),
                  ),
                ],
              ),
              height: 250.0,
              width: 225.0,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 15),
                  Image(
                    image: AssetImage(imagePath),
                    height: 150.0,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 25.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              plantType,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF8AC7A4)), // TextStyle
                            ),
                            Text(
                              plantName,
                              style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white), // TextStyle
                            ),
                          ])
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 28.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    Colors.white.withOpacity(0.8), // TextStyle,
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.wb_sunny,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.water_drop_sharp,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.thermostat,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                      SizedBox(width: 15.0),
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                style: BorderStyle.solid,
                                width: 0.5),
                            borderRadius: BorderRadius.circular(5.0),
                            color: Color(0xFF399D63),
                          ),
                          child: Icon(
                            Icons.cloud,
                            color: Colors.white.withOpacity(0.4),
                            size: 20.0,
                          )),
                    ],
                  )
                ],
              ))),
      Padding(
          padding: EdgeInsets.only(left: 90.0, top: 300.0),
          child: Container(
              height: 45.0,
              width: 45.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Colors.black,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => PlantDetail(
                      index: i,
                    ),
                    transition: Transition.zoom,
                  );
                },
                child: Container(
                  height: 30.0,
                  width: 30.0,
                  child: Icon(Icons.info_outline_rounded,
                      color: Colors.white, size: 30.0),
                ),
              ))),
      SizedBox(width: 30.0),
    ]);
  }
}
