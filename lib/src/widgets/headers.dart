import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBorderRedodeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalCustomPaint(),
      ),
    );
  }
}

class _HeaderDiagonalCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.strokeWidth = 5;
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularCustomPaint(),
      ),
    );
  }
}

class _HeaderTriangularCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoCustomPaint(),
      ),
    );
  }
}

class _HeaderPicoCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    // paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.30);
    path.lineTo(size.width / 2, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoCustomPaint(),
      ),
    );
  }
}

class _HeaderCurvoCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    // path.lineTo(size.width, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.45,
      size.width,
      size.height * 0.30,
    );
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesCustomPaint(),
      ),
    );
  }
}

class _HeaderWavesCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.40,
      size.width * 0.5,
      size.height * 0.3,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.2,
      size.width,
      size.height * 0.3,
    );
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderWavesInvertido extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavesInvertidoCustomPaint(),
      ),
    );
  }
}

class _HeaderWavesInvertidoCustomPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.8);
    // path.quadraticBezierTo(
    //   size.width * 0.25,
    //   size.height * 0.7,
    //   size.width * 0.5,
    //   size.height * 0.8,
    // );

    // path.quadraticBezierTo(
    //   size.width * 0.75,
    //   size.height * 0.9,
    //   size.width,
    //   size.height * 0.8,
    // );

    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.9,
      size.width * 0.5,
      size.height * 0.8,
    );

    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * 0.7,
      size.width,
      size.height * 0.8,
    );
    path.lineTo(size.width, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class HeaderIcons extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subTitulo;
  final Color color1;
  final Color color2;

  const HeaderIcons({
    @required this.icon,
    @required this.titulo,
    @required this.subTitulo,
    this.color1 = Colors.blueGrey,
    this.color2 = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    final colorWhite = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2),
        Positioned(
          left: -70.0,
          top: -50.0,
          child: FaIcon(
            icon,
            size: 250.0,
            color: Colors.white.withOpacity(0.2),
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
            ),
            Text(
              titulo,
              style: TextStyle(fontSize: 20.0, color: colorWhite),
            ),
            SizedBox(height: 20),
            Text(
              subTitulo,
              style: TextStyle(
                fontSize: 25.0,
                color: colorWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            FaIcon(icon, color: colorWhite, size: 80.0),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;

  const _IconHeaderBackground({
    Key key,
    @required this.color1,
    @required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80.0),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            color1,
            color2,
          ],
        ),
      ),
    );
  }
}
