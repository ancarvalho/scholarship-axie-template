import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scholarship/src/shared/themes.dart';
import 'package:provider/provider.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);

  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  late ThemeNotifier _themeNotifier;
  bool isDark = false;
  @override
  void initState() {
    _themeNotifier = context.read<ThemeNotifier>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SwitchListTile(
            title: Text("Dark Mode"),
            value: _themeNotifier.isDark,
            onChanged: (value) {
              if (value) {
                isDark = value;
                _themeNotifier.setDarkMode();
                setState(() {});
              } else {
                isDark = value;
                _themeNotifier.setLightMode();
                setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }
}
