import 'package:diseno_app/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficaCircularPage extends StatefulWidget {
  GraficaCircularPage({Key key}) : super(key: key);

  @override
  _GraficaCircularPageState createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage> {
  double _porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _porcentaje += 10;
          if (_porcentaje > 100) {
            _porcentaje = 0;
          }

          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomPainterContainer(
                porcentaje: _porcentaje,
                colorPrimario: Colors.red,
                strokeWith: 2,
              ),
              CustomPainterContainer(
                porcentaje: _porcentaje,
                colorPrimario: Colors.pinkAccent,
                strokeWith: 2,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomPainterContainer(
                porcentaje: _porcentaje,
                colorPrimario: Colors.orange,
                strokeWith: 2,
              ),
              CustomPainterContainer(
                porcentaje: _porcentaje,
                strokeWith: 2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomPainterContainer extends StatelessWidget {
  final double porcentaje;
  final double strokeWith;
  final Color colorPrimario;
  final Color colorSecundario;

  const CustomPainterContainer({
    @required this.porcentaje,
    this.colorPrimario = Colors.purple,
    this.colorSecundario = Colors.grey,
    this.strokeWith = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      width: 180.0,
      height: 180.0,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.colorPrimario,
        colorSecundario: this.colorSecundario,
        strokeWith: this.strokeWith,
      ),
    );
  }
}
