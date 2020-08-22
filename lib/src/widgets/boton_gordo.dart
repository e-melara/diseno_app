import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonGordo extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BottonGordo({
    @required this.texto,
    this.icon = FontAwesomeIcons.circle,
    this.color1 = Colors.grey,
    this.color2 = Colors.blueGrey,
    @required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: [
          _BotonGordoBackground(this.color1, this.color2, this.icon),
          Row(
            children: [
              SizedBox(height: 140.0, width: 40.0),
              FaIcon(this.icon, color: Colors.white, size: 40.0),
              SizedBox(width: 20.0),
              Expanded(
                child: Text(
                  this.texto,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.white,
              ),
              SizedBox(width: 40.0),
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {
  final Color color1;
  final Color color2;
  final IconData icon;

  _BotonGordoBackground(this.color1, this.color2, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                this.icon,
                color: Colors.white.withOpacity(0.7),
                size: 150.0,
              ),
            )
          ],
        ),
      ),
      height: 100.0,
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4, 6),
            blurRadius: 10.0,
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ],
        ),
      ),
    );
  }
}
