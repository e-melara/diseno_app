import 'dart:math' as Math;
import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final double strokeWith;
  final Color colorPrimario;
  final Color colorSecundario;

  RadialProgress({
    @required this.porcentaje,
    @required this.colorPrimario,
    @required this.colorSecundario,
    @required this.strokeWith,
  });

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  double porcentajeAnterior;
  AnimationController controller;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final double diferencia = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) {
        return Container(
          child: CustomPaint(
            painter: _MiRadialProgress(
              porcentaje: ((widget.porcentaje - diferencia) +
                  (diferencia * controller.value)),
              colorPrimario: widget.colorPrimario,
              colorSecundario: widget.colorSecundario,
              strokeWith: widget.strokeWith,
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final double strokeWith;
  final Color colorPrimario;
  final Color colorSecundario;

  _MiRadialProgress({
    @required this.porcentaje,
    this.strokeWith,
    this.colorPrimario,
    this.colorSecundario,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = strokeWith
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = Math.min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    final paintArco = Paint()
      ..strokeWidth = 10.0
      ..color = colorPrimario
      ..strokeCap = StrokeCap.round
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
