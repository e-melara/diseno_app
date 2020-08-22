import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'package:diseno_app/src/models/slider_model.dart';

class SliderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new SliderModel(),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: _Sliders(),
            ),
            _Dots(),
          ],
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(pageIndex: 0),
          _Dot(pageIndex: 1),
          _Dot(pageIndex: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int pageIndex;

  const _Dot({this.pageIndex});

  @override
  Widget build(BuildContext context) {
    final currentPage = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: 12,
      height: 12,
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: (currentPage >= pageIndex - 0.5 && currentPage < pageIndex + 0.5)
            ? Colors.blue
            : Colors.grey,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Sliders extends StatefulWidget {
  @override
  __SlidersState createState() => __SlidersState();
}

class __SlidersState extends State<_Sliders> {
  final PageController pageController = new PageController();

  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
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
      children: [
        Slide(urlPicture: "assets/svgs/slide-1.svg"),
        Slide(urlPicture: "assets/svgs/slide-2.svg"),
        Slide(urlPicture: "assets/svgs/slide-3.svg"),
      ],
    );
  }
}

class Slide extends StatelessWidget {
  final String urlPicture;

  const Slide({this.urlPicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: SvgPicture.asset(this.urlPicture),
    );
  }
}
