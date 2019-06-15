import 'package:flutter/material.dart';

import 'package:components/src/providers/menu.provider.dart';

import 'package:components/src/pages/alert_page.dart';

import 'package:components/src/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _list(),
    );
  }

  Widget _list() {

    return FutureBuilder(
      future: menuProvider.fetchData(),
      initialData: [],
      builder: ( BuildContext context, AsyncSnapshot<List<dynamic>> snapshot ) {

        return ListView(
          children: _listItems(snapshot.data, context),
        );

      },
    );

  }

  List<Widget> _listItems( List<dynamic> data, BuildContext context ) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
        title: Text(opt['text']),
        leading: getIcon(opt['icon']),
        trailing: Icon( Icons.keyboard_arrow_right, color: Colors.blue ),
        onTap: () {

          Navigator.pushNamed(context, opt['route']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage()
          // );
          // Navigator.push(context, route);
        },
      );
      opciones..add(widgetTemp)
              ..add(Divider());
    });
    
    return opciones;
  }
}