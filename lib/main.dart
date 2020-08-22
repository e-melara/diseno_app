import 'package:flutter/material.dart';

// import 'package:diseno_app/src/pages/animaciones_page.dart';
// import 'package:diseno_app/src/retos/animation_page_cuadrado.dart';
// import 'package:diseno_app/src/pages/header.dart';
// import 'package:diseno_app/src/labs/circula_progress.dart';
// import 'package:diseno_app/src/pages/graficas_circular.dart';
// import 'package:diseno_app/src/labs/slider_pages.dart';
// import 'package:diseno_app/src/pages/slider_show.dart';
// import 'package:diseno_app/src/pages/pinteres_page.dart';
// import 'package:diseno_app/src/pages/emergency_page.dart';
import 'package:diseno_app/src/pages/slider_list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseño app',
      home: SliderListPage(),
    );
  }
}
