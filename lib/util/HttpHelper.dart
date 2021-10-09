import 'dart:convert';

import 'dart:io';
import 'package:chuck_app/models/Chuck.dart';
import 'package:http/http.dart' as http;

class HttpHelper {
  final String urlKey = 'api_key= Your Api key here';
  final String urlBase = 'https://api.chucknorris.io/';
  final String urlUpcoming = 'jokes/random';
  final String urlLanguage = '&language=en-US ';
  List<Chuck> joke = new List.empty();

  Future<Chuck?> getUpcomming(String tipo) async {
    try {
      final String upcoming = urlBase + urlUpcoming + '?category=$tipo';
      http.Response result = await http.get(Uri.parse(upcoming));
      print(upcoming);
      //http.Response result = (await Dio().get(upcoming)) as http.Response;
      if (result.statusCode == HttpStatus.ok) {
        final jsonResponse = jsonDecode(result.body);
        return Chuck.fromJson(jsonResponse);
      } else {
        if (result.statusCode.isEven && result.body.isNotEmpty) {
          return Chuck.withError('error al obtener la data');
        } else {
          return Chuck.withError('error al obtener la data');
        }
      }
    } catch (e) {
      return null;
    }
  }
}
