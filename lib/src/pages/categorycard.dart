import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:chuck_app/src/models/Category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final Function onCardClick;

  CategoryCard({required this.category, required this.onCardClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onCardClick();
        },
        child: Container(
          margin: EdgeInsets.all(20),
          height: 150,
          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/img/' + this.category.image + '.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.7),
                              Colors.transparent
                            ])),
                  )),
              Positioned(
                  bottom: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Todo poner despues
                        /*CategoryIcon(
                                          color: categorias[index].color,
                                          iconName: categorias[index].icon),*/
                        SizedBox(width: 10),
                        ClipOval(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              this.category.tipo,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
