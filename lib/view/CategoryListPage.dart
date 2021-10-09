import 'package:flutter/material.dart';
import 'package:chuck_app/models/Category.dart';
import 'package:chuck_app/util/util.dart';
import 'package:chuck_app/view/joke_list.dart';
import 'package:chuck_app/widget/categorycard.dart';

class CategoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Category> categorias = Utils.categorias;

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
            Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 120),
                    itemCount: categorias.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      return CategoryCard(
                          category: categorias[index],
                          onCardClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => JokesList(
                                        category: categorias[index])));
                          });
                    }))
          ],
        ),
      ),
    );
  }
}
