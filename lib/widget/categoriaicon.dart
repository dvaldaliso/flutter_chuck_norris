import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chuck_app/widget/iconfont.dart';

class CategoryIcon extends StatelessWidget {
  Color? color;
  String? incoName;
  double size;

  CategoryIcon({this.color, this.incoName, this.size = 30});
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
          color: this.color,
          padding: EdgeInsets.all(10),
          child: IconFont(
            color: Colors.white,
            iconName: this.incoName,
            size: this.size,
          )),
    );
  }
}
