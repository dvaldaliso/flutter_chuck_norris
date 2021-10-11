import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/Category.dart';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/categorias.json');
    Map dataMap = json.decode(resp);

    opciones = dataMap['categorias'].map((item) {
      return Category.fromJson(item);
    }).toList();

    return opciones;
  }
}

final menuProvider = new _MenuProvider();
