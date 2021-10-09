import 'package:flutter/material.dart';
import 'package:chuck_app/models/Category.dart';
import 'joke_list.dart';

class Home extends StatefulWidget {
  @override
  _HometState createState() => _HometState();
}

class _HometState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return JokesList(category: Category(image: 'animal', tipo: 'animal'));
  }
}
