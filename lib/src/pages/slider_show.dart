import 'package:diseno_app/src/widgets/slider_show.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SliderShowPage extends StatelessWidget {
  const SliderShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SliderShow(
                bullePrimario: 15,
                bulleSecundario: 12,
                colorSecundario: Colors.grey,
                colorPrimario: Colors.pinkAccent,
                sliders: <Widget>[
                  SvgPicture.asset("assets/svgs/slide-1.svg"),
                  SvgPicture.asset("assets/svgs/slide-2.svg"),
                  SvgPicture.asset("assets/svgs/slide-3.svg"),
                  SvgPicture.asset("assets/svgs/slide-4.svg"),
                  SvgPicture.asset("assets/svgs/slide-5.svg"),
                ],
              ),
            ),
            Expanded(
              child: SliderShow(
                bullePrimario: 16,
                bulleSecundario: 12,
                colorSecundario: Colors.red,
                colorPrimario: Colors.yellow,
                sliders: <Widget>[
                  SvgPicture.asset("assets/svgs/slide-1.svg"),
                  SvgPicture.asset("assets/svgs/slide-2.svg"),
                  SvgPicture.asset("assets/svgs/slide-3.svg"),
                  SvgPicture.asset("assets/svgs/slide-4.svg"),
                  SvgPicture.asset("assets/svgs/slide-5.svg"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
