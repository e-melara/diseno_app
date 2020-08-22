import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestButton {
  final Function onPress;
  final IconData icon;

  PinterestButton({
    @required this.onPress,
    @required this.icon,
  });
}

class PinteresMenuButton extends StatelessWidget {
  final bool mostrar;

  final List<PinterestButton> items = [
    PinterestButton(
        icon: Icons.pie_chart, onPress: () => print("onClick on pie_chart")),
    PinterestButton(
        icon: Icons.search, onPress: () => print("onClick on search")),
    PinterestButton(
        icon: Icons.notifications,
        onPress: () => print("onClick on notifications")),
    PinterestButton(
        icon: Icons.supervised_user_circle,
        onPress: () => print("onClick on supervised_user_circle"))
  ];

  PinteresMenuButton({Key key, this.mostrar = true});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 250),
        opacity: (this.mostrar) ? 1 : 0,
        child: _PinteresBackground(child: _MenuItems(items: items)),
      ),
    );
  }
}

class _PinteresBackground extends StatelessWidget {
  final Widget child;
  const _PinteresBackground({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      width: 200.0,
      height: 60.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10.0,
            spreadRadius: -5,
          ),
        ],
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> items;

  const _MenuItems({this.items});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        items.length,
        (index) => _PinterestMenuButton(index, items[index]),
      ),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  final int index;
  final PinterestButton item;

  const _PinterestMenuButton(this.index, this.item);

  @override
  Widget build(BuildContext context) {
    final itemSeleccionado = Provider.of<_MenuModel>(context).seleccionadoItem;
    bool isSelected = (itemSeleccionado == index);

    return GestureDetector(
      onTap: () {
        Provider.of<_MenuModel>(context, listen: false).seleccionadoItem =
            index;
        item.onPress();
      },
      behavior: HitTestBehavior.translucent,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Icon(
          item.icon,
          size: (isSelected ? 30 : 25),
          color: (isSelected ? Colors.black : Colors.blueGrey),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  int _seleccionadoItem = 0;

  int get seleccionadoItem => this._seleccionadoItem;
  set seleccionadoItem(int value) {
    this._seleccionadoItem = value;
    notifyListeners();
  }
}
