import 'package:chuck_app/src/pages/categorycard.dart';
import 'package:chuck_app/src/util/Provider.dart';
import 'package:chuck_app/src/view/joke_list.dart';
import 'package:flutter/material.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading:
            false, //para que no se vea el icon de drawawer
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 24.0,
              semanticLabel: 'Text to announce in accessibility modes',
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                'Seleccione una Categoria',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
            Expanded(child: _lista())
          ],
        ),
      ),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listItems(snapshot.data, context),
        );
      },
    );
  }

  _listItems(List? data, context) {
    final List<Widget> opciones = [];
    data!.forEach((opt) {
      final widgetTemp = CategoryCard(
        category: opt,
        onCardClick: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => JokesList(category: opt)));
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });
    return opciones;
  }
}
