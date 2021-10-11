import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholarship/app.dart';
import 'package:scholarship/src/shared/storage_manager.dart';
import 'package:scholarship/src/shared/themes.dart';

void main() {
  runApp(Providers());
}

class Providers extends StatelessWidget {
  const Providers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => StorageManager(),
        )
      ],
      child: App(),
    );
  }
}
