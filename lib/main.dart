import 'dart:async';

import 'package:flutter/material.dart';
import 'package:chuck_app/view/CategoryListPage.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chuck norris',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
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
          /*if (snapshot.data == null) {
          return Column(
            children: [
              Text(
                ' ChuckNorris ',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ),
              Text(
                'Your Device not Connect',
              ),
            ],
          );
          } else if (snapshot.data == true) {*/
          return Center(
              child: Text(
            'Chuck Norris!!',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue),
          ));
          /*} else {
            return Column(
              children: [
                Text(
                  'Hi ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue),
                ),
                Text(
                  'Your Device not Connect',
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    initTimer();
                  },
                  child: Text('TextButton'),
                )
              ],
            );
          }*/
        },
      )),
    );
  }
}
