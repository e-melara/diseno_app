import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:diseno_app/src/routes.dart';
import 'package:diseno_app/src/themes/themes.dart';

class LauncherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter'),
      ),
      drawer: _MenuPrincipal(),
      body: _ListaOpciones(),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routes = getApplicationRoutesPages;
    final currentTheme = Provider.of<ThemeChanger>(context).currentData;

    return ListView.separated(
      itemCount: routes.length,
      separatorBuilder: (context, index) => Divider(
        color: currentTheme.accentColor,
      ),
      itemBuilder: (context, index) {
        return ListTile(
          leading: FaIcon(routes[index].icon, color: currentTheme.accentColor),
          title: Text(routes[index].title),
          trailing: Icon(Icons.chevron_right, color: currentTheme.accentColor),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => routes[index].page),
            );
          },
        );
      },
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);

    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundColor: appTheme.currentData.accentColor,
                  child: Text('EM', style: TextStyle(fontSize: 50.0)),
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            SafeArea(
              top: false,
              bottom: true,
              right: false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.lightbulb_outline,
                    color: appTheme.currentData.accentColor),
                title: Text('Dark Mode'),
                trailing: Switch.adaptive(
                  value: appTheme.darkTheme,
                  activeColor: appTheme.currentData.accentColor,
                  onChanged: (value) {
                    appTheme.darkTheme = value;
                  },
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline,
                  color: appTheme.currentData.accentColor),
              title: Text('Custom Theme'),
              trailing: Switch.adaptive(
                value: appTheme.customTheme,
                activeColor: appTheme.currentData.accentColor,
                onChanged: (value) {
                  appTheme.customTheme = value;
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
