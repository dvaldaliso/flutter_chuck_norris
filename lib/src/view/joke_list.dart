import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:chuck_app/src/models/Category.dart';
import 'package:chuck_app/src/models/Chuck.dart';
import 'package:chuck_app/src/pages/listItem.dart';
import '../util/HttpHelper.dart';

class JokesList extends StatefulWidget {
  final Category category;

  JokesList({required this.category});

  get nameOfCategort {
    return category.tipo;
  }

  @override
  _JokeListState createState() => _JokeListState();
}

class _JokeListState extends State<JokesList> {
  late ScrollController _scrollController;
  HttpHelper? helper;
  List<Chuck> jokes = [];
  bool _checkConnection = false;

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    helper = HttpHelper();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);

    fetchfive();
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      setState(() => _checkConnection = true);
    } else {
      setState(() => _checkConnection = false);
    }
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => _checkConnection = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => _checkConnection = true);
        break;
      case ConnectivityResult.none:
        setState(() => _checkConnection = false);
        break;
      default:
        setState(() => _checkConnection = false);
        break;
    }
  }

  void _scrollListener() {
    var maxScroll = _scrollController.position.maxScrollExtent;
    var currenPosition = _scrollController.position.pixels;
    if (currenPosition > maxScroll - 1) {
      fetchfive();
    }
  }

  Future<bool> initialize() async {
    //if (_checkConnection) {
    print(_checkConnection);
    Chuck? chuck = await helper!.getUpcomming(widget.category.tipo);
    if (chuck != null) {
      // chequear si ya existe
      if (!existe(jokes, chuck)) {
        jokes.add(chuck);
      }
      setState(() {
        jokes = jokes;
      });
      return true;
    } else {
      return false;
    }

    //}
  }

  bool existe(List<Chuck> list, Chuck nuevaChuck) {
    int exist = list.indexWhere((element) => element.id == nuevaChuck.id);
    if (exist == -1) {
      // no existe
      return false;
    } else {
      // existe
      return true;
    }
  }

  fetchfive({int a = 10}) async {
    for (int i = 0; i < a; i++) {
      if (await initialize()) {
        continue;
      } else {
        setState(() {
          _checkConnection = false;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.tipo.toUpperCase()),
        ),
        body: FutureBuilder(
          future: helper!.getUpcomming(widget.category.tipo),
          builder: (BuildContext context, snapshot) {
            if (!_checkConnection) {
              return Center(
                  child: Text(
                'Chuck Norris!!',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue),
              ));
            }
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 50),
                  controller: _scrollController,
                  itemCount: jokes.length,
                  itemBuilder: (BuildContext context, index) => ListItem(
                      index: index,
                      chuck: jokes[index],
                      listLenght: jokes.length));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            return Container(
              child: Center(
                child: new CircularProgressIndicator(),
              ),
            );
          },
        ));
  }
}
