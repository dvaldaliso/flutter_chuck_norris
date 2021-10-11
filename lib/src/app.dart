import 'dart:async';

import 'package:chuck_app/src/view/CategoryListPage.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initTimer();
  }

  void initTimer() async {
    // ignore: unrelated_type_equality_checks
    //if (await checkConnectivity()) {
    Timer(Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CategoryListPage()));
    });
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: FutureBuilder(
        builder: (BuildContext c, snapshot) {
          return Center(
              child: Text(
            'Chuck Norris!!',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ));
        },
      )),
    );
  }
}
