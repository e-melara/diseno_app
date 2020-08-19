import 'dart:math' as Math;
import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation<double> rotation;
  Animation<double> opacity;
  Animation<double> mover;
  Animation<double> scale;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 8000),
    );

    rotation = Tween<double>(
      begin: 0.0,
      end: 2.0 * Math.pi,
    ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInExpo),
    );

    opacity = Tween<double>(begin: 0.1, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1, curve: Curves.bounceIn),
      ),
    );

    scale = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceIn),
    );

    mover = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceInOut),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget childRectangulo) {
        return Transform.translate(
          offset: Offset(mover.value, 0),
          child: Transform.rotate(
            angle: rotation.value,
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: scale.value,
                child: childRectangulo,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.0,
      height: 70.0,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
