import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/plantlist_model.dart';
import 'package:stacked/stacked.dart';

import '../viewmodel/plantlist_viewmodel.dart';

class PlantListView extends StatefulWidget {
  const PlantListView({super.key, required this.title});
  final String title;
  _PlantListViewState createState() => _PlantListViewState();
}

class _PlantListViewState extends State<PlantListView> {
  PlantListViewModel model = PlantListViewModel();
  @override
  void initState() {
    super.initState();
   
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PlantListViewModel(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Consumer<PlantListViewModel>(
                builder: (context, viewModel, child) {
              return ViewModelBuilder<PlantListModel>.reactive(
                  builder: (context, model, child) => ListView(
                        children: <Widget>[
                          Container(
                            height: 350.0,
                            child: ListView(
                              padding: EdgeInsets.only(left: 25.0),
                              controller: viewModel.scrollController,
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                for (int i = 0;
                                    i <
                                        viewModel
                                            .listchanger(widget.title)
                                            .length;
                                    i++)
                                  Row(
                                    children: <Widget>[
                                      viewModel.getPlantCard(
                                          viewModel
                                              .listchanger(widget.title)[i]
                                              .imageUrl,
                                          
                                          viewModel
                                              .listchanger(widget.title)[i]
                                              .type,
                                          viewModel
                                              .listchanger(widget.title)[i]
                                              .name,
                                          viewModel
                                              .listchanger(widget.title)[i]
                                              .ind),
                                      SizedBox(width: 30.0),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, top: 10.0, right: 25.0),
                              child: Text(
                                'Description',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500),
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, top: 10.0, right: 25.0),
                              child: Text(
                                viewModel.description,
                                style: const TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.black,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w300),
                              )),
                        ],
                      ),
                  viewModelBuilder: () => PlantListModel());
            })));
  }
}
