import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:diseno_app/src/retos/animation_page_cuadrado.dart';
import 'package:diseno_app/src/pages/emergency_page.dart';
import 'package:diseno_app/src/pages/graficas_circular.dart';
import 'package:diseno_app/src/pages/header.dart';
import 'package:diseno_app/src/pages/pinteres_page.dart';
import 'package:diseno_app/src/pages/slider_list_page.dart';
import 'package:diseno_app/src/pages/slider_show.dart';

final List<_Route> getApplicationRoutesPages = <_Route>[
  _Route(
      page: SliderShowPage(),
      icon: FontAwesomeIcons.slideshare,
      title: 'SlidesShow'),
  _Route(
    page: EmergencyPage(),
    icon: FontAwesomeIcons.ambulance,
    title: 'Emergencia',
  ),
  _Route(
    page: HeaderPage(),
    icon: FontAwesomeIcons.heading,
    title: 'Encabezados',
  ),
  _Route(
    page: AnimacionCuadroPage(),
    icon: FontAwesomeIcons.ambulance,
    title: 'Cuadro Animado',
  ),
  _Route(
    page: PinteresPage(),
    icon: FontAwesomeIcons.pinterest,
    title: 'Pinterest',
  ),
  _Route(
    page: SliderListPage(),
    icon: FontAwesomeIcons.ambulance,
    title: 'Cuadro Animado',
  ),
  _Route(
    page: GraficaCircularPage(),
    icon: FontAwesomeIcons.ambulance,
    title: 'Barra Progreso',
  ),
];

class _Route {
  final IconData icon;
  final Widget page;
  final String title;

  _Route({this.icon, this.page, this.title});
}
