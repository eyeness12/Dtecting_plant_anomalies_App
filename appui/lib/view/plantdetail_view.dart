import 'package:flutter/material.dart';
import '../data/plantinfo.dart';

class PlantDetail extends StatefulWidget {
  const PlantDetail({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<PlantDetail> createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context, {index}) {
    return Material(
      child: Row(
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF399D63),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
            ),
            Positioned(
                top: MediaQuery.of(context).size.height / 3,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.white,
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: 7.0, top: 40.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back,
                          color: Colors.white.withOpacity(0.8)),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 25.0, top: 100.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        allList[widget.index].type,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8AC7A4)),
                      ),
                      Text(
                        allList[widget.index].name,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 45.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      SizedBox(height: 30.0),
                      Text(
                        'SIZES',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF8AC7A4)),
                      ),
                      Text(
                        allList[widget.index].size,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                      ),
                      SizedBox(height: 10.0),
                    ])),
            Positioned(
              top: (MediaQuery.of(context).size.height / 2.60) - 156.0,
              left: (MediaQuery.of(context).size.width / 1.75) - 130.0,
              child: Image(
                image: AssetImage(allList[widget.index].imageUrl),
                fit: BoxFit.cover,
                height: 250.0,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height - 450.0,
                    left: 20.0,
                    right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'All to know',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 7.0),
                    Container(
                      width: 360,
                      child: Wrap(children: [
                        Text(
                          allList[widget.index].alltoknow,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                          ),
                        ),
                      ]),
                    ),
                    SizedBox(height: 15.0),
                    widget.index <= 3 ?
                    Text(
                      'Anomalies',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600),
                    ): Container(),
                    SizedBox(height: 10.0),
                    if (allList[widget.index].anomalies != null)
                      for (int i = 0;
                          i < allList[widget.index].anomalies.length;
                          i++)
                        Text(
                          allList[widget.index].anomalies[i],
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14.0,
                          ),
                        ),
                  ],
                ))
          ]),
        ],
      ),
    );
  }
}
