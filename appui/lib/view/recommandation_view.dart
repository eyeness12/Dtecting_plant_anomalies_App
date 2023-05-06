import 'dart:io';
import 'package:appui/model/recommandation_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/anomalies.dart';
import 'package:stacked/stacked.dart';
import '../viewmodel/recommandation_viewmodel.dart';

class RecommendationView extends StatefulWidget {
  const RecommendationView(
      {super.key,
      required this.output,
      required this.indanomaly,
      required this.image});
  final int indanomaly;
  final String output;
  final File? image;
  @override
  _RecommendationViewState createState() => _RecommendationViewState();
}

class _RecommendationViewState extends State<RecommendationView> {
  @override
  Widget build(BuildContext context, {indanomaly, output, image}) {
    return ChangeNotifierProvider(
        create: (context) => RecommandationViewModel(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body: Consumer<RecommandationViewModel>(
                builder: (context, viewModel, child) {
              return ViewModelBuilder<RecommendationModel>.reactive(
                  builder: (context, model, child) =>
                      ListView(children: <Widget>[
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
                                      color: const Color.fromARGB(0, 0, 0, 0)
                                          .withOpacity(
                                        0.8,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  Row(
                                    children: <Widget>[
                                      Container(
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image.file(widget.image!,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover))),
                                      SizedBox(width: 15.0),
                                      Text(widget.output)
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 40.0, right: 40.0, top: 20.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    height: 70,
                                    child: widget.output != " powdery mildew"
                                        ? DropdownButtonFormField<String>(
                                            value: viewModel.selectedOption1,
                                            onChanged: (value) {
                                              setState(() {
                                                viewModel.modifyOption1(value!);
                                                viewModel.modifyText1(true);
                                                viewModel.modifyTest(false);
                                                viewModel.modifyColor(false);
                                                if (value == "Yellow") {
                                                  viewModel.modifyTest(true);
                                                  viewModel.modifyColor(true);
                                                  viewModel.modifyText1(false);
                                                } else if (anoarg[
                                                            widget.indanomaly]
                                                        .options[0][0] ==
                                                    value) {
                                                  viewModel.modifyX(0);
                                                } else if (anoarg[
                                                            widget.indanomaly]
                                                        .options[0][1] ==
                                                    value) {
                                                  viewModel.modifyX(1);
                                                }
                                              });
                                            },
                                            items: [
                                              for (int j = 0;
                                                  j <
                                                      anoarg[widget.indanomaly]
                                                          .options[0]
                                                          .length;
                                                  j++)
                                                DropdownMenuItem(
                                                  value:
                                                      anoarg[widget.indanomaly]
                                                          .options[0][j],
                                                  child: Text(
                                                      anoarg[widget.indanomaly]
                                                          .options[0][j]),
                                                ),
                                            ],
                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                    width: 1.5,
                                                    color: Color.fromARGB(
                                                        255,
                                                        0,
                                                        0,
                                                        0)), //<-- SEE HERE
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                    width: 2.5,
                                                    color: Color(0xFF399D63)),
                                              ),
                                              labelText: 'Color',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 22.0),
                                              border: OutlineInputBorder(),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(height: 40),
                                  Container(
                                    height: 70,
                                    child: widget.output != " powdery mildew" &&
                                            viewModel.selectedOption1 !=
                                                "Yellow"
                                        ? DropdownButtonFormField<String>(
                                            value: viewModel.selectedOption2,
                                            onChanged: (value) {
                                              setState(() {
                                                viewModel.modifyOption2(value!);
                                                viewModel.modifyText2(true);
                                                viewModel.modifyTest(false);
                                                viewModel.modifyColor(false);
                                              });
                                            },
                                            items: [
                                              for (int j = 0;
                                                  j <
                                                      anoarg[widget.indanomaly]
                                                          .options[1]
                                                          .length;
                                                  j++)
                                                DropdownMenuItem(
                                                  value:
                                                      anoarg[widget.indanomaly]
                                                          .options[1][j],
                                                  child: Text(
                                                      anoarg[widget.indanomaly]
                                                          .options[1][j]),
                                                ),
                                            ],
                                            decoration: const InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                    width: 1.5,
                                                    color: Color.fromARGB(
                                                        255,
                                                        0,
                                                        0,
                                                        0)), //<-- SEE HERE
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                borderSide: BorderSide(
                                                    width: 2.5,
                                                    color: Color(0xFF399D63)),
                                              ),
                                              labelText: 'Size',
                                              labelStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 22.0),
                                              border: OutlineInputBorder(),
                                            ),
                                          )
                                        : Container(),
                                  ),
                                  const SizedBox(
                                    height: 40.0,
                                  ),
                                  widget.output != " powdery mildew"
                                      ? Container(
                                          height: 70,
                                          child: viewModel.selectedOption1 !=
                                                  "Yellow"
                                              ? DropdownButtonFormField<String>(
                                                  value:
                                                      viewModel.selectedOption3,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      viewModel.modifyOption3(
                                                          value!);
                                                      viewModel
                                                          .modifyText3(true);
                                                      viewModel
                                                          .modifyTest(false);
                                                      viewModel
                                                          .modifyColor(false);
                                                    });
                                                  },
                                                  items: [
                                                    for (int j = 0;
                                                        j <
                                                            anoarg[widget
                                                                    .indanomaly]
                                                                .options[2]
                                                                .length;
                                                        j++)
                                                      DropdownMenuItem(
                                                        value: anoarg[widget
                                                                .indanomaly]
                                                            .options[2][j],
                                                        child: Text(anoarg[
                                                                widget
                                                                    .indanomaly]
                                                            .options[2][j]),
                                                      ),
                                                  ],
                                                  decoration:
                                                      const InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          width: 1.5,
                                                          color: Color.fromARGB(
                                                              255,
                                                              0,
                                                              0,
                                                              0)), //<-- SEE HERE
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.0),
                                                      ),
                                                      borderSide: BorderSide(
                                                          width: 2.5,
                                                          color: Color(
                                                              0xFF399D63)),
                                                    ),
                                                    labelText: 'Conditions',
                                                    labelStyle: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 22.0),
                                                    border:
                                                        OutlineInputBorder(),
                                                  ),
                                                )
                                              : Container(),
                                        )
                                      : Container(
                                          child: !viewModel.coloryellow
                                              ? const Text(
                                                  "Provide adequate air circulation around plants \n Remove and dispose of infected plant material promptly to prevent the disease from spreading.\n Fungicides can be used to control powdery mildew mildew, but they are most effective when used preventively.\n Some effective fungicides for powdery mildew include sulfur, potassium bicarbonate, and neem oil.	"
                                                  // Add the text identifier ]above by surrounding with curly braces and the $
                                                  )
                                              : Container(),
                                        ),
                                  const SizedBox(height: 30.0),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 90.0, top: 10.0, right: 90.0),
                                      child: ((viewModel.text1 &
                                                      viewModel.text2 &
                                                      viewModel.text3) &&
                                                  !viewModel.coloryellow) ||
                                              ((viewModel.text1 &
                                                      viewModel.text2 &
                                                      viewModel.text3) &
                                                  (widget.output !=
                                                      " powdery mildew"))
                                          ? MaterialButton(
                                              onPressed: () {
                                                setState(() {
                                                  viewModel.modifyTest(true);
                                                });
                                              },
                                              child: Container(
                                                height: 60.0,
                                                width: 60.0,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0),
                                                  color: const Color.fromARGB(
                                                      255, 0, 0, 0),
                                                ),
                                                child: const Icon(Icons.check,
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    size: 30.0),
                                              ),
                                            )
                                          : Container()),
                                  const SizedBox(height: 20.0),
                                  Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10.0, right: 10.0),
                                      child: (viewModel.test)
                                          ? Container(
                                              child: Padding(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                          child: Text(viewModel
                                                              .afficherRecommandation(
                                                                  widget
                                                                      .indanomaly)))
                                                    ],
                                                  )))
                                          : Container()),
                                ]))
                      ]),
                  viewModelBuilder: () => RecommendationModel());
            })));
  }
}
