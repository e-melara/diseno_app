import 'package:flutter/material.dart';

class AnimacionCuadroPage extends StatelessWidget {
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

  Animation<double> mIzq;
  Animation<double> mDerec;
  Animation<double> mArr;
  Animation<double> mAbj;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    );

    controller.addListener(() {
      if (controller.status == AnimationStatus.completed) {
        controller.repeat();
      }
    });

    mDerec = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        curve: Interval(0.0, 0.25, curve: Curves.bounceIn),
        parent: controller,
      ),
    );

    mArr = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        curve: Interval(0.25, 0.50, curve: Curves.bounceIn),
        parent: controller,
      ),
    );

    mIzq = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        curve: Interval(0.50, 0.75, curve: Curves.bounceIn),
        parent: controller,
      ),
    );

    mAbj = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(
        curve: Interval(0.75, 1.0, curve: Curves.bounceIn),
        parent: controller,
      ),
    );

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
          offset: Offset(0, mAbj.value),
          child: Transform.translate(
            offset: Offset(-mIzq.value, 0),
            child: Transform.translate(
              offset: Offset(0, -mArr.value),
              child: Transform.translate(
                offset: Offset(mDerec.value, 0),
                child: _Rectangulo(),
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
