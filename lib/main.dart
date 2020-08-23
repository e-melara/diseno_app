import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:diseno_app/src/themes/themes.dart';
import 'package:diseno_app/src/pages/launcher_page.dart';

void main() {
  return runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => new ThemeChanger(1),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: appTheme.currentData,
      debugShowCheckedModeBanner: false,
      title: 'Diseño app',
      home: LauncherPage(),
    );
  }
}
