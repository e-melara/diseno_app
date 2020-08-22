import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/headers.dart';
import 'package:diseno_app/src/widgets/boton_gordo.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  final List<ItemBoton> items = <ItemBoton>[
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
    new ItemBoton(FontAwesomeIcons.carCrash, 'Motor Accident',
        Color(0xff6989F5), Color(0xff906EF5)),
    new ItemBoton(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2),
        Color(0xff536CF6)),
    new ItemBoton(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement',
        Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemBoton(FontAwesomeIcons.biking, 'Awards', Color(0xff317183),
        Color(0xff46997D)),
  ];
  @override
  Widget build(BuildContext context) {
    final itemBGordo = this
        .items
        .map(
          (item) => BottonGordo(
            texto: item.texto,
            color1: item.color1,
            color2: item.color2,
            icon: item.icon,
            onPress: () {},
          ),
        )
        .toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 200.0),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 80.0),
                ...itemBGordo,
              ],
            ),
          ),
          HeaderIcons(
            icon: FontAwesomeIcons.plus,
            subTitulo: "Asistencia Medica",
            titulo: "Haz solicitado",
            color1: Color(0xff526FB6),
            color2: Color(0xff67ACF2),
          ),
        ],
      ),
    );
  }
}

class BotonGordTemp extends StatelessWidget {
  const BotonGordTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottonGordo(
      icon: FontAwesomeIcons.carCrash,
      color1: Color(0xFF6989F5),
      color2: Color(0xFF906EF5),
      texto: "Motor Accident",
      onPress: () {
        print("Click en el boton");
      },
    );
  }
}
