import 'package:flutter/services.dart' show rootBundle;

import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    // fetchData();
  }

  Future<List<dynamic>> fetchData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    opciones = dataMap['routes'];

    return opciones;
  }
}

final menuProvider = new _MenuProvider();