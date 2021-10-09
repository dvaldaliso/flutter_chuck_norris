import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chuck_app/models/Chuck.dart';

class ListItem extends StatelessWidget {
  final int index;
  final Chuck chuck;
  final int listLenght;
  const ListItem(
      {required this.index, required this.chuck, required this.listLenght});

  @override
  Widget build(BuildContext context) {
    print('$index $listLenght');
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        child: index == listLenght
            ? Center(
                child: new CircularProgressIndicator(),
              )
            : Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(this.chuck.iconUrl),
                  ),
                  title: Text(this.chuck.value),
                ),
                elevation: 8,
                shadowColor: Colors.blueGrey,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.blue, width: 1)),
              ));
  }
}
