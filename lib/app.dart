import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholarship/src/features/splash/splash.dart';
import 'package:scholarship/src/manage.dart';
import 'package:scholarship/src/shared/themes.dart';

class App extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  late ThemeNotifier controller;
  @override
  void initState() {
    // Future.delayed(Duration(seconds: 2));
    controller = context.read<ThemeNotifier>();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScholarShip',
      theme: controller.getTheme(),
      initialRoute: "/",
      routes: {
        "/": (_) => Splash(),
        "/manage": (_) => Manage(),
      },
    );
  }
}
