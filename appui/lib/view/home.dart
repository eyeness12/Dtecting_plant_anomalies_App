import 'package:appui/view/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          color: Colors.white,
        ),
        ClipPath(
            clipper: MyClipper(),
            child: Stack(
              children: [
                RiveAnimation.asset(
                  "assets/greenwaves.riv",
                  fit: BoxFit.cover,
                ),
              ],
            )),
        Positioned(
          top: -145,
          left: -35,
          child: Image.asset(
            'assets/logo2.png',
            height: 450,
            width: 450,
          ),
        ),
        Positioned(
          top: 450,
          left: 100,
          child: Text(
            "Welcome",
            style: TextStyle(
              color: Color.fromARGB(255, 245, 244, 244),
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
            top: 520,
            left: 100,
            child: Text(
              "Detection of plant anomalies",
              style: TextStyle(
                color: Color.fromARGB(255, 245, 244, 244),
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            )),
        Positioned(
            top: 560,
            left: 110,
            child: Text(
              "Cure recommendation",
              style: TextStyle(
                color: Color.fromARGB(255, 245, 244, 244),
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            )),
        Positioned(
            top: 655,
            left: 75,
            child: GestureDetector(
              onTap: () {
                Get.to(
                    () => MyHomePage(
                          title: 'my home page',
                        ),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(seconds: 1));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "get started",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(CupertinoIcons.arrow_right,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ],
              ),
            ))
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width * 0.1666600, size.height * -0.0069771);
    path0.quadraticBezierTo(size.width * 0.1469400, size.height * 0.5537052,
        size.width * 0.1553200, size.height * 0.7080677);
    path0.cubicTo(
        size.width * 0.1479200,
        size.height * 0.7643456,
        size.width * 0.5808200,
        size.height * 0.6835431,
        size.width * 0.6069800,
        size.height * 0.7754894);
    path0.cubicTo(
        size.width * 0.5687600,
        size.height * 0.8569071,
        size.width * 0.3306400,
        size.height * 0.8087248,
        size.width * 0.3345800,
        size.height * 0.8389122);
    path0.quadraticBezierTo(size.width * 0.3272800, size.height * 0.9751678,
        size.width * 0.3559400, size.height * 1.2742170);
    path0.lineTo(size.width * 0.9952600, size.height * 1.2719379);
    path0.lineTo(size.width * 0.9999400, size.height * -0.0013842);
    path0.lineTo(size.width * 0.1643400, size.height * -0.0083753);

    return path0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
