import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class SliderShow extends StatelessWidget {
  final List<Widget> sliders;
  final Color colorPrimario;
  final Color colorSecundario;
  final int bullePrimario;
  final int bulleSecundario;

  const SliderShow({
    @required this.sliders,
    this.colorPrimario,
    this.colorSecundario,
    this.bullePrimario,
    this.bulleSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _SliderShowModel(),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            final provider = Provider.of<_SliderShowModel>(context);
            provider.colorPrimario = this.colorPrimario;
            provider.colorSecundario = this.colorSecundario;
            provider.bullePrimario = this.bullePrimario;
            provider.bulleSecundario = this.bulleSecundario;

            return Column(
              children: [
                Expanded(
                  child: _Sliders(sliders: this.sliders),
                ),
                _Dots(count: this.sliders.length),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int count;

  const _Dots({this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          this.count,
          (index) => _Dot(pageIndex: index),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int pageIndex;

  const _Dot({this.pageIndex});

  @override
  Widget build(BuildContext context) {
    double tamano;
    Color color;
    final provider = Provider.of<_SliderShowModel>(context);

    if (provider.currentPage >= pageIndex - 0.5 &&
        provider.currentPage < pageIndex + 0.5) {
      color = provider.colorPrimario;
      tamano = provider.bullePrimario.toDouble();
    } else {
      color = provider.colorSecundario;
      tamano = provider.bulleSecundario.toDouble();
    }
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: tamano,
      height: tamano,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  final List<Widget> sliders;

  const _Sliders({this.sliders});

  @override
  __SlidersState createState() => __SlidersState();
}

class __SlidersState extends State<_Sliders> {
  final PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      Provider.of<_SliderShowModel>(context, listen: false).currentPage =
          pageController.page;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children:
          widget.sliders.map((slider) => new Slide(element: slider)).toList(),
    );
  }
}

class Slide extends StatelessWidget {
  final Widget element;

  const Slide({@required this.element});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: this.element,
    );
  }
}

class _SliderShowModel extends ChangeNotifier {
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  int _bullePrimario = 12;
  int _bulleSecundario = 12;

  double get currentPage => this._currentPage;
  set currentPage(double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;
  set colorPrimario(Color colorPrimario) {
    this._colorPrimario = colorPrimario;
  }

  Color get colorSecundario => this._colorSecundario;
  set colorSecundario(Color secundario) {
    this._colorSecundario = secundario;
  }

  int get bullePrimario => this._bullePrimario;
  int get bulleSecundario => this._bulleSecundario;

  set bullePrimario(int value) {
    this._bullePrimario = value;
  }

  set bulleSecundario(int value) {
    this._bulleSecundario = value;
  }
}
