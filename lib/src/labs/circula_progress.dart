import 'dart:math' as Math;
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  double _porcentaje = 0;
  double _nuevoPorcetaje = 0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      setState(() {
        _porcentaje =
            lerpDouble(_porcentaje, _nuevoPorcetaje, controller.value);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _porcentaje = _nuevoPorcetaje;
          _nuevoPorcetaje += 10.0;
          if (_nuevoPorcetaje > 100) {
            _nuevoPorcetaje = 0;
            _porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          padding: EdgeInsets.all(8.0),
          // color: Colors.red,
          child: CustomPaint(
            painter: _MiRadialProgress(porcentaje: _porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;

  _MiRadialProgress({@required this.porcentaje});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3.0
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
      ..strokeWidth = 10.0
      ..color = Colors.pinkAccent
      ..style = PaintingStyle.stroke;
    final radiusArc = (Math.pi * 2 * (porcentaje / 100));

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -Math.pi * 0.5,
      radiusArc,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
