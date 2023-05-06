import 'package:appui/view/recommandation_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/anomalies.dart';
import '../model/detection_model.dart';
import '../viewmodel/detection_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetectionView extends StatefulWidget {
  @override
  _DetectionViewState createState() => _DetectionViewState();
}

class _DetectionViewState extends State<DetectionView> {
  List<dynamic> _output = [
    {'confidence': 0.9978812336921692, 'index': 0, 'label': "healthy"}
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetectionViewModel(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<DetectionViewModel>(
          builder: (context, viewModel, child) {
            return ViewModelBuilder<DetectionModel>.reactive(
                builder: (context, model, child) => ListView(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 50.0, left: 10),
                          child: Container(
                            width: 500,
                            height: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: viewModel.loading
                                ? Container(
                                    child: Column(
                                    children: const <Widget>[
                                      SizedBox(height: 180.0),
                                      Text(
                                        "The selected image",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Montserrat',
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      Text(
                                        "will be shown here.",
                                        style: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontFamily: 'Montserrat',
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60.0,
                                      ),
                                    ],
                                  ))
                                : Container(
                                    child: Column(
                                    children: <Widget>[
                                      Container(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.file(
                                                  viewModel.image!,
                                                  width: 320,
                                                  height: 300,
                                                  fit: BoxFit.cover))),
                                      SizedBox(height: 20),
                                      viewModel.output != null
                                          ? Text('${_output[0]['label']}',
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 6, 6, 6),
                                                  fontSize: 20))
                                          : Container()
                                    ],
                                  ))),
                        const SizedBox(height: 40.0),
                        GestureDetector(
                          onTap: () {
                            viewModel.takePhoto().then((output) => setState(() {
                                  _output = viewModel.output;
                                }));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width - 190,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 17),
                              decoration: BoxDecoration(
                                  color: Color(0xFF399D63),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text(
                                "Take a photo",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.pickImage().then((output) => setState(() {
                                  _output = viewModel.output;
                                }));
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width - 190,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 17),
                              decoration: BoxDecoration(
                                  color: Color(0xFF399D63),
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const Text(
                                "Open Gallery",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontFamily: 'Montserrat',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                        const SizedBox(
                          height: 80.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: 90.0, top: 10.0, right: 90.0),
                            child: (!viewModel.loading) &&
                                    (_output[0]['label'] != " healthy")
                                ? Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Colors.black,
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        for (int i = 0;
                                            i < anoarg.length;
                                            i++) {
                                          if (anoarg[i].name ==
                                              _output[0]['label']) {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        RecommendationView(
                                                          indanomaly: i,
                                                          output: _output[0]
                                                              ['label'],
                                                          image:
                                                              viewModel.image!,
                                                        )));
                                          }
                                        }
                                      },
                                      child: Container(
                                        height: 40.0,
                                        width: 40.0,
                                        child: const Icon(
                                            Icons.arrow_forward_outlined,
                                            color: Colors.white,
                                            size: 30.0),
                                      ),
                                    ))
                                : Container()),
                      ],
                    ),
                viewModelBuilder: () => DetectionModel());
          },
        ),
      ),
    );
  }
}
