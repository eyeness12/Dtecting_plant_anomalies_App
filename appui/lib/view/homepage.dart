import 'package:appui/view/detection_view.dart';
import 'package:appui/view/plantlist_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget>[
        const SizedBox(height: 15.0),
        const Padding(
            padding: EdgeInsets.all(14.0),
            child: Text(
              'Top Picks',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontSize: 40.0,
                  fontWeight: FontWeight.w300),
            )),
        Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey.withOpacity(0.8),
                isScrollable: true,
                tabs: const <Widget>[
                  Tab(
                    child: Text(
                      'All',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Plants',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Anomalies',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ])),
        Container(
          height: MediaQuery.of(context).size.height - 240.0,
          child: TabBarView(
            controller: tabController,
            children: const <Widget>[
              PlantListView(
                title: 'All',
              ),
              PlantListView(
                title: 'Plants',
              ),
              PlantListView(
                title: 'Anomalies',
              ),
              // PlantList()
            ],
          ),
        ),
        Center(
            child: Container(
                height: 62.0,
                width: 62.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => DetectionView(),
                        transition: Transition.fadeIn,
                        duration: Duration(seconds: 1));
                  },
                  child: Container(
                    height: 15.0,
                    width: 15.0,
                    child: Icon(Icons.add,
                        color: Color.fromARGB(255, 255, 255, 255), size: 30.0),
                  ),
                ))),
      ]),
    );
  }
}
