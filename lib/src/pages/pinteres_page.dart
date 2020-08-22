import 'package:diseno_app/src/widgets/pinteres_menu_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

class PinteresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => new _MenuModel(),
        child: Builder(
          builder: (context) {
            final mostrar = Provider.of<_MenuModel>(context).mostrar;

            return Stack(
              children: [
                _PinteresList(),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    width: width,
                    child: Align(
                      child: PinteresMenuButton(
                        mostrar: mostrar,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PinteresList extends StatefulWidget {
  @override
  __PinteresListState createState() => __PinteresListState();
}

class __PinteresListState extends State<_PinteresList> {
  double _scrollAnterior = 0;
  ScrollController controller = new ScrollController();
  final List<int> items = List.generate(200, (index) => index);

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.offset > _scrollAnterior && controller.offset > 150) {
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }
      _scrollAnterior = controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinteresItem(
        index: index,
      ),
      staggeredTileBuilder: (int index) =>
          StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinteresItem extends StatelessWidget {
  final int index;
  const _PinteresItem({
    @required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
      ),
      child: Center(
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text('$index'),
        ),
      ),
    );
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;
  set mostrar(bool value) {
    this._mostrar = value;
    notifyListeners();
  }
}
