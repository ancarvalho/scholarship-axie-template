import 'package:flutter/material.dart';
import 'package:scholarship/src/shared/storage_manager.dart';
import 'package:provider/provider.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2))
        .then((value) => Navigator.pushReplacementNamed(context, "/manage"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          // color: Color(0xfff8c539),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                .2,
                .4,
                .6,
                .8,
              ],
                  colors: [
                Color(0xff00308F),
                Color(0xff1034A6),
                Color(0xff005A92),
                Color(0xff6BCAE2),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => LinearGradient(colors: [
                  Color(0xff63c5da),
                  Color(0xff00CED1)
                ]).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  "Scholarship",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decorationColor: Colors.blue[900]),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
