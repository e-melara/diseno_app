import 'package:diseno_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: HeaderBorderRedodeados(),
      // body: HeaderCuadrado(),
      body: HeaderWavesInvertido(),
    );
  }
}
